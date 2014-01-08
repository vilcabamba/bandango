Bandango.ItemOnFormMixin = Ember.Mixin.create
  
  itemSelected: (itemObject) ->
    itemObject.item

  didInsertElement: ->
    @_super()
    store = @get("controller.store")
    $(".item_textfield").autocomplete
      serviceUrl: "/api/items.json"
      onSelect: $.proxy(@itemSelected, @)
      transformResult: (response) =>
        response = JSON.parse response, Bandango.jsonCamelizedReviver
        { 
          suggestions: response.items.map (itemObject) ->
            item = store.push "item", itemObject
            { value: itemObject.nombre, item: item }
        }

  willDestroyElement: ->
    @_super()
    $(".item_textfield").autocomplete "dispose"
