Bandango.OrderItemFormView = Ember.View.extend Bandango.ItemOnFormMixin,
  templateName: "order_items/form"
  tagName: "tr"
  cantidad: 1

  itemSelected: (itemObject) ->
    store = @get("controller.store")
    store.find("item", itemObject.id).then (item) =>
      # item = store.typeMapFor(Bandango.Item).idToRecord[itemObject.id]   # 'dirty'
      orderItem = store.createRecord("orderItem", cantidad: @get("cantidad"), item: item)
      @get("parentView.model").addOrderItem orderItem
      $(".item_textfield").val null
