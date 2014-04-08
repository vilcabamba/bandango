money = Bandango.numberForCurrencyHelper
humanize = Bandango.humanizeTimeFormatHelper.humanize

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
  createdAt:             DS.attr()

  user:                  DS.belongsTo("user")
  cashDenominationItems: DS.hasMany("cashDenominationItem")

# properties
  toS: (->
    "#{humanize(@get("createdAt"), "short_full")} - #{@get("user.firstNames")}"
  ).property("createdAt", "user.firstNames")

  totalVentas: (->
    money(@get("efectivoVentas")) + money(@get("ivaVentas")) + money(@get("iceVentas"))
  ).property("efectivoVentas", "ivaVentas", "iceVentas")

  totalCompras: (->
    money(@get("efectivoCompras")) + money(@get("ivaCompras")) + money(@get("iceCompras"))
  ).property("efectivoCompras", "ivaCompras", "iceCompras")

  descuadre: (->
    @get("efectivoReal") - @get("efectivoTeorico")
  ).property("efectivoReal")

  hasDescuadre: (->
    @get("descuadre") != 0
  ).property("descuadre")

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

# methods
  rollbackAssociations: ->
    for cashDenominationItem in @get("cashDenominationItems.content").filterBy("isNew")
      cashDenominationItem.deleteRecord()
