class Balance
  include ActiveModel::Model

  def self.methods(*args)
    args.each do |arg|
      self.class.instance_eval do
        method_name = "#{arg}"
        define_method method_name do |*args|
          self
        end
      end
    end
  end

  def self.at(date)
    @@date = date
    self
  end

  def self.total
    total = Venta.at(@@date).total - Compra.at(@@date).total
    total.round(2)
  end

  methods :includes
end
