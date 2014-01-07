# Bandango.Venta
Bandango.OrderItemsMixin = Ember.Mixin.create
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
