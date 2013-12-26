Bandango.FacturasNewView = Ember.View.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

  willInsertElement: ->
    @$(".identificacion_input").on("keyup" , $.proxy(@identificacionKeyUpped, @))
                               .on("change", $.proxy(@identificacionChanged, @))

  willDestroyElement: ->
    @$(".identificacion_input").off("keyup").off("change")

  identificacionChanged: (event) ->
    @queryForCliente event.target.value

  identificacionKeyUpped: (event) ->
    value = event.target.value
    if value.length is 10 or value.length is 13
      @queryForCliente value

  gotCliente: (clientes) ->
    cliente = clientes.get("firstObject")
    console.log cliente.get("nombres")

  didNotGetCliente: ->
    console.log arguments

  queryForCliente: (identificacion) ->
    unless @get("currentId") == identificacion
      @set "currentId", identificacion
      store = @get("controller").get("store")
      store.find("cliente", identificacion: identificacion).then $.proxy(@gotCliente, @), $.proxy(@didNotGetCliente, @)

  submit: ->
    console.log "submit!"
    false
