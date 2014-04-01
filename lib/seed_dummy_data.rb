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
      end
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
