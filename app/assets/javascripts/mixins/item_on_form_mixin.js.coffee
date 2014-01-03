Bandango.ItemOnFormMixin = Ember.Mixin.create
  
  itemSelected: (item) ->
    Ember.debug "selected item: #{item.nombre}"

  didInsertElement: ->
    @_super()
    $(".item_textfield").autocomplete
      serviceUrl: "/api/items.json"
      onSelect: $.proxy(@itemSelected, @)

  willDestroyElement: ->
    @_super()
    $(".item_textfield").autocomplete "dispose"
