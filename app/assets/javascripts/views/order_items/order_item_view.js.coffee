Bandango.OrderItemView = Ember.View.extend
  templateName: "order_items/show"
  classNames: ["order_item_view"]
  tagName: "tr"

  showEdit: (->
    @get("parentView.includeForm")
  ).property()

  removeOrderItem: ->
    @get("model").deleteRecord()
    @$().addClass("hidden") unless @get("model.isNew") # hacky way to hide view when editing

  didInsertElement: ->
    @$(".glyphicon").on "click", $.proxy(@removeOrderItem, @)

  willDestroyElement: ->
    @$(".glyphicon").off "click"
