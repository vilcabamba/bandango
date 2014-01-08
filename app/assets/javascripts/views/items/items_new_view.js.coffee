Bandango.ItemsNewView = Bandango.ItemFormView.extend
  bindAttributesTo: null

  success: (item) ->
    @successCallback item, "creado"

  failure: (response) ->
    @newItem.deleteRecord()
    @failureCallback response

  submit: ->
    @emptyErrors
    data = @getFormData()
    store = @get("controller.store")
    @newItem = store.createRecord "item", data
    @newItem.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
