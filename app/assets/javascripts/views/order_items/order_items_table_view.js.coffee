Bandango.OrderItemsTableView = Ember.View.extend
  includeForm: false
  templateName: "order_items/table"

  venta: (->
    @get("parentView.model").constructor is Bandango.Venta
  ).property("parentView.model")
