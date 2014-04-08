# encoding: utf-8
class SeedDummyData
  class << self
    def run
      puts "Populating with dummy data"
      wipe_db!
      load_yml_data!
      add_users!
      add_emisor!
      add_clientes!
      add_categories!
      add_compras_and_ventas!
    end

    def wipe_db!
      Rails.logger.info "- wiping db"
      User.destroy_all
      Emisor.destroy_all
      Cliente.destroy_all
      Category.destroy_all
      Compra.destroy_all
      Venta.destroy_all
      CierreCaja.destroy_all
    end

    def load_yml_data!
      @@data = YAML::load_file(File.join(Rails.root.to_s, "config", "dummy_data.yml")).symbolize_keys
    end

    def add_users!
      Rails.logger.info "- adding users"
      @@data[:users].each do |user|
        User.create! user
      end
    end

    def add_emisor!
      Rails.logger.info "- adding emisor"
      Emisor.create! @@data[:emisor]
    end

    def add_clientes!
      @@data[:clientes].each do |cliente|
        Cliente.create! cliente
      end
      Rails.logger.info "- added #{@@data[:clientes].count} clientes"
    end

    def add_categories!
      @@data[:categories].each do |category_name, items|
        category = Category.create! nombre: category_name
        items.each do |item_params|
          Item.create! item_params.merge category: category, iva: true, se_compra: true, se_vende: true
        end
      end
      Rails.logger.info "- added #{@@data[:categories].count} categories"
    end

    def add_compras_and_ventas!
      time_range = (Date.today - 50.days)..Date.today
      time_range.each do |date|
        [Compra, Venta].each do |klass|
          times_for(klass).times do
            params = {
              cliente: random("cliente"),
              comprobante: random("comprobante"),
              fecha_registro: date,
              fecha_emision: date,
              numero_serie_establecimiento: numero_serie,
              numero_serie_punto_emision: numero_serie,
              numero_serie_comprobante: numero_serie,
              autorizacion_comprobante: rand(999999999999),
              order_items_params: order_items_params
            }
            params = params.merge(sustento_comprobante: random("sustento_comprobante")) if klass == Compra
            order = klass.create! params
            order.update!(fecha_emision: date) if klass == Venta
          end
        end
        create_cierre_caja_for!(date)
      end
    end

    def create_cierre_caja_for!(date)
      cierre_caja = CierreCaja.new.prepare!
      efectivo = cierre_caja.efectivo_teorico.to_f
      return if efectivo <= 0
      cantidades = %w(20.0 10.0 5.0 0.25 0.01).inject({}) do |hash, cash_denomination|
        hash.tap do |hash|
          qty = (efectivo / cash_denomination.to_f).floor
          hash[cash_denomination] = qty
          efectivo -= (cash_denomination.to_f * qty).round(2)
        end
      end
      if rand(6) > 4 # randomly set descuadre
        cantidades.each do |k, v|
          cantidades[k] -= rand(v) if v > 1
        end
      end
      cierre_caja.cash_denomination_items = CashDenomination.all.map do |cash_denomination|
        CashDenominationItem.new(cash_denomination: cash_denomination, cantidad: cantidades[cash_denomination.price.to_s].to_i)
      end
      cierre_caja.retiro = rand(cierre_caja.send(:calculate_efectivo_real))
      cierre_caja.created_at = (date.to_time + rand(10).hours + rand(60).minutes)
      cierre_caja.user = random("user")
      cierre_caja.save!
    end

    def times_for(klass)
      if klass == Compra
        rand(5) + 1
      else
        rand(6) + 3
      end
    end

    def order_items_params
      (rand(10) + 1).times.map do
        order_item_params
      end
    end

    def order_item_params
      cantidad = rand(10) + 2
      { cantidad: cantidad, item_id: random("item").id }
    end

    def random(model_name)
      klass = model_name.camelize.constantize
      record = klass.offset(rand(klass.count)).first
      if model_name == "cliente" and record.consumidor_final?
        record = random "cliente"
      end
      record
    end

    def numero_serie
      %w(001 002 003 004 005 006 007).sample
    end
  end
end
