class CierreCajaSerializer < ActiveModel::Serializer
  attributes :id,
             :totales,
             :fondo_anterior,
             :efectivo_compras,
             :iva_compras,
             :ice_compras,
             :efectivo_ventas,
             :iva_ventas,
             :ice_ventas,
             :efectivo_teorico,
             :efectivo_real,
             :retiro

  def fondo_anterior
    object.fondo_anterior
  end

  def totales
    # don't send money object on totales. Send only amounts
    object.totales.each do |total|
      total[:sum] = total[:sum].amount if total[:sum].is_a?(Money)
    end
  end

  def attributes
    hash = super
    # parse money items
    hash.each do |k, v|
      hash[k] = v.amount if hash[k].is_a?(Money)
    end
    hash
  end

  has_one :user, embed: :ids, include: true
end
