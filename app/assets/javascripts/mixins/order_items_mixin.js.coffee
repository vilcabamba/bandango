Bandango.OrderItemsMixin = Ember.Mixin.create
# methods
  rollbackAssociations: ->
    for orderItem in @get("orderItems.content").filterBy("isDirty")
      orderItem.rollback()
    @get("cliente").rollback() if @get("cliente.isDirty")

# isVenta
  isVenta: (->
    @constructor is Bandango.Venta
  ).property()

# retenciones
  persistedRetenciones: (->
    Ember.debug "computing persistedRetenciones"
    @get("retenciones").rejectBy "inForm"
  ).property("retenciones.@each")

# orderItem relationships
  orderItemsIds: (->
    Ember.debug "computing orderItemsIds"
    @get("orderItems.content").map (orderItem) ->
      orderItem.get("item.id")
  ).property("orderItems.@each")

  addOrderItem: (orderItem) ->
    idToLook = orderItem.get("item.id")
    if @get("orderItemsIds").contains(idToLook)
      oldOrderItem = @get("orderItems.content").findBy("item.id", idToLook)
      oldOrderItem.incrementProperty "cantidad", orderItem.get("cantidad")
      orderItem.rollback()
    else
      @get("orderItems").addObject orderItem

# summary operations
  numeroDeSerie: (->
    "#{@get("numeroSerieEstablecimiento")} - #{@get("numeroSeriePuntoEmision")} - #{@get("numeroSerieComprobante")}"
  ).property("numeroSerieEstablecimiento", "numeroSeriePuntoEmision", "numeroSerieComprobante")

  ivaZero: (->
    ivaZero = @get("orderItems.content").reduce (prev, orderItem) =>
      prev + orderItem.get("ivaZero#{@get("modelName")}")
    , 0
    Bandango.numberForCurrencyHelper ivaZero
  ).property("orderItems.@each.item.baseCompra", "orderItems.@each.item.baseVenta", "orderItems.@each.cantidad")

  ivaTwelve: (->
    ivaTwelve = @get("orderItems.content").reduce (prev, orderItem) =>
      prev + orderItem.get("ivaTwelve#{@get("modelName")}")
    , 0
    Bandango.numberForCurrencyHelper ivaTwelve
  ).property("orderItems.@each.item.baseCompra", "orderItems.@each.item.baseVenta", "orderItems.@each.cantidad")

  totalPrice: (->
    totalPrice = @get("orderItems.content").reduce (prev, orderItem) =>
      prev + orderItem.get("totalPrice#{@get("modelName")}")
    , 0
    Bandango.numberForCurrencyHelper totalPrice
  ).property("orderItems.@each.item.baseCompra", "orderItems.@each.item.baseVenta", "orderItems.@each.cantidad")

  ice: (->
    @get("orderItems.content").reduce (prev, orderItem) =>
      prev + orderItem.get("ice#{@get("modelName")}")
    , 0
  ).property("orderItems.@each.item.baseCompra", "orderItems.@each.item.baseVenta", "orderItems.@each.cantidad")
