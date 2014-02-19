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
    @get("orderItems.content").reduce (prev, orderItem) =>
      ivaZero = orderItem.get "item.ivaZero#{@get("modelName")}"
      prev + orderItem.get("cantidad") * ivaZero
    , 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  ivaTwelve: (->
    @get("orderItems.content").reduce (prev, orderItem) =>
      ivaTwelve = orderItem.get "item.ivaTwelve#{@get("modelName")}"
      prev + orderItem.get("cantidad") * ivaTwelve
    , 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  totalPrice: (->
    @get("orderItems.content").reduce (prev, orderItem) =>
      totalPrice = orderItem.get "item.totalPrice#{@get("modelName")}"
      prev + orderItem.get("cantidad") * totalPrice
    , 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  ice: (->
    @get("orderItems.content").reduce (prev, orderItem) =>
      ice = orderItem.get "item.ice#{@get("modelName")}"
      prev + orderItem.get("cantidad") * ice
    , 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")
