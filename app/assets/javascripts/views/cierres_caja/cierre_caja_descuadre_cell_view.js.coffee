Bandango.CierreCajaDescuadreCellView = Ember.View.extend
  tagName: "td"
  template: Ember.Handlebars.compile("<span {{bind-attr class=':label view.descuadreClass'}}>{{view.descuadreValue}}</span>")

  descuadreClass: (->
    if @get("model.hasDescuadre")
      "label-danger"
    else
      "label-default"
  ).property("model.hasDescuadre")

  descuadreValue: (->
    text = Bandango.numberToCurrencyHelper(@get("model.descuadre"))
    if @get("model.descuadre") > 0 # add a '+'
      i = text.indexOf(Bandango.currencyPrefix)
      j = i + Bandango.currencyPrefix.length
      text = text.slice(i, j) + "+" + text.slice(j, text.length-1)
    text
  ).property("model.descuadre")

