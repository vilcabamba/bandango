# == Schema Information
#
# Table name: cierres_caja
#
#  id                     :integer          not null, primary key
#  user_id                :integer          not null
#  totales                :text
#  fondo_anterior_cents   :integer          default(0), not null
#  efectivo_compras_cents :integer          default(0), not null
#  iva_compras_cents      :integer          default(0), not null
#  ice_compras_cents      :integer          default(0), not null
#  efectivo_ventas_cents  :integer          default(0), not null
#  iva_ventas_cents       :integer          default(0), not null
#  ice_ventas_cents       :integer          default(0), not null
#  efectivo_teorico_cents :integer          default(0), not null
#  efectivo_real_cents    :integer          default(0), not null
#  retiro_cents           :integer          default(0), not null
#  created_at             :datetime
#  updated_at             :datetime
#

class CierreCaja < ActiveRecord::Base
  register_currency :usd

# scopes
  scope :recent, -> { order(id: :desc) }

# relationships
  belongs_to :user
  has_many :cash_denomination_items, dependent: :destroy
  has_many :cierre_caja_orders, dependent: :destroy
  # has_many :orders, through: :cierre_caja_orders

# validations
  validate :validate_has_transacciones
  validate :validate_has_info
  validates :user_id, presence: true
  validates :fondo_anterior,
            :retiro,
            :nuevo_fondo,
            :efectivo_real,
            :efectivo_teorico,
            :ice_ventas,
            :iva_ventas,
            :efectivo_ventas,
            :ice_compras,
            :iva_compras,
            :efectivo_compras,
            numericality: { greater_than_or_equal_to: 0 }

# serializations
  serialize :totales

# callbacks
  before_validation :prepare!

# money
  monetize :fondo_anterior_cents
  monetize :efectivo_compras_cents
  monetize :iva_compras_cents
  monetize :ice_compras_cents
  monetize :efectivo_ventas_cents
  monetize :iva_ventas_cents
  monetize :ice_ventas_cents
  monetize :efectivo_teorico_cents
  monetize :efectivo_real_cents
  monetize :retiro_cents

# accessors
  attr_accessor :compras
  attr_accessor :compras_efectivo
  attr_accessor :ventas
  attr_accessor :ventas_efectivo

# methods
  def validate_has_transacciones
    errors.add(:cierre_caja_orders, "No puedes cerrar una caja sin transacciones") if cierre_caja_orders.empty?
  end

  def validate_has_info
    errors.add(:base, "No puedes cerrar una caja sin retiro o detalle de efectivo") if without_cash_denomination_items? and without_retiro?
  end

  def without_retiro?
    retiro.blank? or not retiro.to_f > 0
  end

  def without_cash_denomination_items?
    cash_denomination_items.empty? or cash_denomination_items.all? { |c| c.cantidad == 0 }
  end

  def assign_orders!
    self.compras ||= Compra.where "id > :id", id: CierreCajaOrder.last_order_id_for("Compra")
    self.compras_efectivo ||= compras.efectivo.includes(:order_items)
    self.ventas ||= Venta.where "id > :id", id: CierreCajaOrder.last_order_id_for("Venta")
    self.ventas_efectivo ||= ventas.efectivo.includes(:order_items)
    self.cierre_caja_orders = (compras + ventas).map do |order|
      CierreCajaOrder.new order: order, cierre_caja: self
    end
  end

  def prepare!
    assign_orders!
    self.fondo_anterior = CierreCaja.last.try(:nuevo_fondo) || 0
    self.efectivo_compras = compras_efectivo.map(&:total_price).reduce(:+).to_f.round 2
    self.iva_compras = compras_efectivo.map(&:total_iva).reduce(:+).to_f.round 2
    self.ice_compras = compras_efectivo.map(&:total_ice).reduce(:+).to_f.round 2
    self.efectivo_ventas = ventas_efectivo.map(&:total_price).reduce(:+).to_f.round 2
    self.iva_ventas = ventas_efectivo.map(&:total_iva).reduce(:+).to_f.round 2
    self.ice_ventas = ventas_efectivo.map(&:total_ice).reduce(:+).to_f.round 2
    self.efectivo_teorico = fondo_anterior + total_ventas - total_compras
    self.efectivo_real = calculate_efectivo_real
    self.totales ||= calculate_totales
    self
  end

  def total_compras
    efectivo_compras + iva_compras + ice_compras
  end

  def total_ventas
    efectivo_ventas + iva_ventas + ice_ventas
  end

  def nuevo_fondo
    efectivo_real - retiro
  end

  def cash_denomination_items_params=(cash_denomination_params)
    cash_denomination_items.destroy_all
    self.cash_denomination_items = Array(cash_denomination_params).map do |cash_denomination|
      CashDenominationItem.new cash_denomination
    end
  end

  private

  def calculate_totales
    formas_de_pago = (compras.formas_de_pago + ventas.formas_de_pago).uniq
    formas_de_pago.map do |forma_de_pago|
      if forma_de_pago == "Efectivo"
        qty = compras_efectivo.count + ventas_efectivo.count
        sum = efectivo_teorico
      else
        qty = ventas.pago(forma_de_pago).count
        sum = ventas.pago(forma_de_pago).map(&:total_price).reduce(:+)
      end
      sum = sum.amount if sum.is_a?(Money)
      { name: forma_de_pago, qty: qty, sum: sum }
    end
  end

  def calculate_efectivo_real
    cash_denomination_items.reduce(0) do |sum, cash_denomination_item|
      sum + cash_denomination_item.total
    end
  end
end
