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

  ivaZeroReduceCallback: (prev, orderItem) ->
    ivaZero = if @get("isVenta")
       orderItem.get("item.ivaZeroVenta")
    else
      orderItem.get("item.ivaZeroCompra")
    prev + orderItem.get("cantidad") * ivaZero
  ivaZero: (->
    @get("orderItems.content").reduce $.proxy(@ivaZeroReduceCallback, @), 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  ivaTwelveReduceCallback: (prev, orderItem) ->
    ivaTwelve = if @get("isVenta")
      orderItem.get("item.ivaTwelveVenta")
    else
      orderItem.get("item.ivaTwelveCompra")
    prev + orderItem.get("cantidad") * ivaTwelve
  ivaTwelve: (->
    @get("orderItems.content").reduce $.proxy(@ivaTwelveReduceCallback, @), 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  totalPriceReduceCallback: (prev, orderItem) ->
    totalPrice = if @get("isVenta")
      orderItem.get("item.totalPriceVenta")
    else
      orderItem.get("item.totalPriceCompra")
    prev + orderItem.get("cantidad") * totalPrice
  totalPrice: (->
    @get("orderItems.content").reduce $.proxy(@totalPriceReduceCallback, @), 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  iceReduceCallback: (prev, orderItem) ->
    ice = if @get("isVenta")
      orderItem.get("item.iceVenta")
    else
      orderItem.get("item.iceCompra")
    prev + orderItem.get("cantidad") * ice
  ice: (->
    @get("orderItems.content").reduce $.proxy(@iceReduceCallback, @), 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")
