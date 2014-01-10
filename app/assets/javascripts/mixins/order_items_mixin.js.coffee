Bandango.OrderItemsMixin = Ember.Mixin.create

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
  ivaZeroReduceCallback: (prev, orderItem) ->
    prev + orderItem.get("cantidad") * orderItem.get("item.ivaZero")
  ivaZero: (->
    @get("orderItems.content").reduce @ivaZeroReduceCallback, 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  ivaTwelveReduceCallback: (prev, orderItem) ->
    prev + orderItem.get("cantidad") * orderItem.get("item.ivaTwelve")
  ivaTwelve: (->
    @get("orderItems.content").reduce @ivaTwelveReduceCallback, 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")

  totalPriceReduceCallback: (prev, orderItem) ->
    prev + orderItem.get("cantidad") * orderItem.get("item.totalPrice")
  totalPrice: (->
    @get("orderItems.content").reduce @totalPriceReduceCallback, 0
  ).property("orderItems.@each.item.base", "orderItems.@each.cantidad")
