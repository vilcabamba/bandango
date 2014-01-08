Bandango.CategoriasNewView = Bandango.ModelBackedView.extend
  bindAttributesTo: null
  attributes: ["nombre"]

  success: (category) ->
    @successCallback "#{category.get("nombre")} creada"
    @get("controller").transitionToRoute "categorias.index"

  failure: (response) ->
    @newCategory.deleteRecord()
    @failureCallback response

  submit: ->
    @emptyErrors()
    data = @getFormData()
    store = @get("controller.store")
    @newCategory = store.createRecord "category", data
    @newCategory.save().then $.proxy(@success, @), $.proxy(@failure, @)
    @set "submitting", true
    false
