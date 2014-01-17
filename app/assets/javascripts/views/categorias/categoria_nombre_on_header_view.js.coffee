Bandango.CategoriaNombreOnHeaderView = Ember.View.extend
  templateName: "categorias/nombre_on_header"
  tagName: "h2"
  attributeBindings: ["contenteditable"]
  contenteditable: "true"

  blur: (e) ->
    model = @get("model")
    @originalName = model.get("nombre")
    unless @originalName is e.target.textContent
      model.set "nombre", e.target.textContent
      model.save().then $.proxy(@success, @), @failure

  failure: ->
    alertify.log "Ups, algo salió mal."

  success: ->
    alertify.log "#{@originalName} cambió a #{@get("model.nombre")}"
