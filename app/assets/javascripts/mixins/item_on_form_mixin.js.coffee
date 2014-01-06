Bandango.ItemOnFormMixin = Ember.Mixin.create
  
  itemSelected: (item) ->
    Ember.debug "selected item: #{item.nombre}"

  didInsertElement: ->
    @_super()
    $(".item_textfield").autocomplete
      serviceUrl: "/api/items.json"
      keyPath: "items"
      valueKey: "nombre"
      onSelect: $.proxy(@itemSelected, @)
      onSearchComplete: (query, suggestions) =>
        store = @get("controller").get("store")
        for suggestion in suggestions
          store.push "item", suggestion

  willDestroyElement: ->
    @_super()
    $(".item_textfield").autocomplete "dispose"
