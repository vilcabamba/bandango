Bandango.ItemOnFormMixin = Ember.Mixin.create

  serviceUrl: (->
    "/api/items.json?type=#{@get("type")}"
  ).property("parentView.parentView.model")

  type: (->
    if @get("parentView.parentView.model.isVenta") then "venta" else "compra"
  ).property("parentView.parentView.model.isVenta")

  itemSelected: (itemObject) ->
    itemObject.item

  priceFor: (itemObject) ->
    Bandango.numberToCurrencyHelper itemObject["base_#{@get("type")}"]

  didInsertElement: ->
    @_super()
    store = @get("controller.store")
    $(".item_textfield").autocomplete
      serviceUrl: @get("serviceUrl")
      onSelect: $.proxy(@itemSelected, @)
      transformResult: (response) =>
        response = JSON.parse response, Bandango.jsonCamelizedReviverHelper
        { suggestions: response.items.map (itemObject) =>
            item = store.push "item", itemObject
            { value: "#{itemObject.nombre} - #{@priceFor(itemObject)}", item: item }
        }

  willDestroyElement: ->
    @_super()
    $(".item_textfield").autocomplete "dispose"
