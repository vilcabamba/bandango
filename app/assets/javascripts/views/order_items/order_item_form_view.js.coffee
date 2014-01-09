Bandango.OrderItemFormView = Ember.View.extend Bandango.ItemOnFormMixin,
  templateName: "order_items/form"
  tagName: "tr"
  cantidad: 1

  itemSelected: (itemObject) ->
    item = @_super(itemObject)
    store = @get("controller.store")
    orderItem = store.createRecord("orderItem", cantidad: @get("cantidad"), item: item)
    @get("parentView.parentView.model").addOrderItem orderItem
    $(".item_textfield").val null
