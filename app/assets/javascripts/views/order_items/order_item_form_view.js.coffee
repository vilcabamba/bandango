Bandango.OrderItemFormView = Ember.View.extend Bandango.ItemOnFormMixin,
  templateName: "order_items/form"
  tagName: "tr"

  itemSelected: (itemObject) ->
    store = @get("controller.store")
    store.find("item", itemObject.id).then (item) =>
      # item = store.typeMapFor(Bandango.Item).idToRecord[itemObject.id]   # 'dirty'
      orderItem = store.createRecord("orderItem", cantidad: 1, item: item)
      @get("parentView.model").get("orderItems").addObject orderItem
      $(".item_textfield").val null
