Bandango.ItemsEditView = Bandango.ItemFormView.extend
  modelBinding: "controller.model"

  success: (item) ->
    @successCallback item, "actualizado"

  failure: (response) ->
    @get("model").rollback()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    item = @get("model")
    item.setProperties data
    item.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
