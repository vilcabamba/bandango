Bandango.CierreCajaDescuadreCellView = Ember.View.extend
  tagName: "td"
  classNameBindings: "descuadreClass".w()
  template: Ember.Handlebars.compile("{{view.descuadreValue}}")

  descuadreClass: (->
    "text-danger" if @get("model.descuadre") != 0
  ).property("model.descuadre")

  descuadreValue: (->
    text = Bandango.numberToCurrencyHelper(@get("model.descuadre"))
    if @get("model.descuadre") > 0 # add a '+'
      i = text.indexOf(Bandango.currencyPrefix)
      j = i + Bandango.currencyPrefix.length
      text = text.slice(i, j) + "+" + text.slice(j, text.length-1)
    text
  ).property("model.descuadre")

