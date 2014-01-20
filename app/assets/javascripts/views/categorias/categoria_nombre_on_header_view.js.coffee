Bandango.CategoriaNombreOnHeaderView = Ember.View.extend
  templateName: "categorias/nombre_on_header"
  tagName: "h2"
  attributeBindings: ["contenteditable"]
  contenteditable: "true"

  blur: (e) ->
    model = @get("model")
    @originalName = model.get("nombre")
    newName = $.trim e.target.textContent
    unless @originalName is newName
      model.set "nombre", newName
      model.save().then $.proxy(@success, @), @failure

  failure: ->
    alertify.log "Ups, algo salió mal."

  success: ->
    alertify.log "#{@originalName} cambió a #{@get("model.nombre")}"
