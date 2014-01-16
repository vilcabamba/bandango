Bandango.ItemOnFormMixin = Ember.Mixin.create

  serviceUrl: (->
    base = "/api/items.json"
    if @get("parentView.parentView.model.isVenta")
      base + "?type=venta"
    else
      base + "?type=compra"
  ).property("parentView.parentView.model")
  
  itemSelected: (itemObject) ->
    itemObject.item

  didInsertElement: ->
    @_super()
    store = @get("controller.store")
    $(".item_textfield").autocomplete
      serviceUrl: @get("serviceUrl")
      onSelect: $.proxy(@itemSelected, @)
      transformResult: (response) =>
        response = JSON.parse response, Bandango.jsonCamelizedReviverHelper
        { 
          suggestions: response.items.map (itemObject) ->
            item = store.push "item", itemObject
            { value: itemObject.nombre, item: item }
        }

  willDestroyElement: ->
    @_super()
    $(".item_textfield").autocomplete "dispose"
