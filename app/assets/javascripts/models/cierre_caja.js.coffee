money = Bandango.numberForCurrencyHelper

Bandango.CierreCaja = DS.Model.extend
  totales:               DS.attr()
  fondoAnterior:         DS.attr("number")
  efectivoVentas:        DS.attr("number")
  ivaVentas:             DS.attr("number")
  iceVentas:             DS.attr("number")
  efectivoCompras:       DS.attr("number")
  ivaCompras:            DS.attr("number")
  iceCompras:            DS.attr("number")
  efectivoTeorico:       DS.attr("number")
  efectivoReal:          DS.attr("number")
  retiro:                DS.attr("number")

  user:                  DS.belongsTo("user")
  cashDenominationItems: DS.hasMany("cashDenominationItem")

# properties
  totalVentas: (->
    money(@get("efectivoVentas")) + money(@get("ivaVentas")) + money(@get("iceVentas"))
  ).property("efectivoVentas", "ivaVentas", "iceVentas")

  totalCompras: (->
    money(@get("efectivoCompras")) + money(@get("ivaCompras")) + money(@get("iceCompras"))
  ).property("efectivoCompras", "ivaCompras", "iceCompras")

  descuadre: (->
    @get("efectivoReal") - @get("efectivoTeorico")
  ).property("efectivoReal")

  nuevoFondo: (->
    @get("efectivoReal") - money(@get("retiro"))
  ).property("efectivoReal", "retiro")

# observers
  efectivoRealObserver: (->
    efectivoReal = @get("cashDenominationItems").reduce (prev, cashDenominationItem) ->
      prev + cashDenominationItem.get("totalPrice")
    , 0
    @set "efectivoReal", efectivoReal
  ).observes("cashDenominationItems.@each.cantidad")
