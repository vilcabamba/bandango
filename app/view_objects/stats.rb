class Stats
  DAYS = 7

  def self.for(scope)
    venta_scope = Venta.send(scope)
    compra_scope = Compra.send(scope)

    {
      name: I18n.t("date.#{scope}").capitalize,
      ventas: {
        count: venta_scope.count,
        total: venta_scope.total
      },
      compras: {
        count: compra_scope.count,
        total: compra_scope.total
      }
    }
  end

  def self.format_date(date)
    I18n.l date, format: :highcharts
  end

  def self.interval
    "#{format_date categories.first} - #{format_date categories.last}"
  end

  def self.categories
    @@categories ||= ((Date.today - DAYS.days)..Date.today).to_a
  end

  def self.categories_str
    categories.map do |date|
      format_date date
    end
  end

  def self.color_for(name)
    case name
    when "compra"
      "rgb(123,188,155)"
    when "venta"
      "rgb(188,217,147)"
    when "balance"
      "rgb(16,73,106)"
    end
  end

  def self.data_for(name)
    categories.map do |date|
      name.capitalize.constantize.at(date).total
    end
  end

  def self.name_for(name)
    if name == "balance" then name else name.pluralize end
  end

  def self.serie_for(name)
    { name: name_for(name),
      color: color_for(name),
      data: data_for(name) }
  end

  def self.series
    [serie_for("compra"), serie_for("venta"), serie_for("balance")]
  end

  def self.chart
    { interval: self.interval,
      categories: categories_str,
      series: series }
  end
end
