class Balance
  def self.total
    date = Thread.current[:date]
    total = Venta.at(date).total - Compra.at(date).total
    total.to_f.round 2
  end

  def self.at(date)
    Thread.current[:date] = date
    self
  end

  def self.includes=(*args)
    self
  end
end
