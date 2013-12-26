Bandango.FacturasNewView = Ember.View.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]


# cliente methods
  clienteChanged: (->
    cliente = @get("cliente") || Ember.Object.create()
    attributes = ["tipoId", "nombres", "direccion", "telefono", "email"]
    for attribute in attributes
      @set attribute, cliente.get(attribute)
  ).observes("cliente")

  didInsertElement: ->
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
    @setProperties
      isFetchingCliente: false
      cliente: clientes.get("firstObject")

  didNotGetCliente: ->
    @setProperties
      isFetchingCliente: false
      cliente: null

  queryForCliente: (identificacion) ->
    unless @get("currentId") == identificacion
      @setProperties
        isFetchingCliente: true
        currentId: identificacion
      store = @get("controller").get("store")
      store.find("cliente", identificacion: identificacion).then $.proxy(@gotCliente, @), $.proxy(@didNotGetCliente, @)

# view methods
  submit: ->
    console.log "submit!"
    false
