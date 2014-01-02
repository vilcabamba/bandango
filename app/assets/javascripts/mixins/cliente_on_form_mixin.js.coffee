Bandango.ClienteOnFormMixin = Ember.Mixin.create
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

# view events
  clienteChanged: (->
    Ember.debug "cliente changed"
    cliente = @get("cliente") || Ember.Object.create()
    attributes = ["tipoId", "nombres", "direccion", "telefono", "email"]
    for attribute in attributes
      @set attribute, cliente.get(attribute)
  ).observes("cliente")

# query callbacks
  gotClientes: (clientes) ->
    @setProperties
      isFetchingCliente: false
      cliente: clientes.get("firstObject")

  didNotGetCliente: ->
    @setProperties
      isFetchingCliente: false
      cliente: undefined

# query methods
  queryForCliente: (identificacion) ->
    unless @get("currentClienteId") == identificacion
      @setProperties
        isFetchingCliente: true
        currentClienteId: identificacion
      store = @get("controller").get("store")
      store.find("cliente", identificacion: identificacion).then $.proxy(@gotClientes, @), $.proxy(@didNotGetCliente, @)

# input callbacks
  identificacionChanged: (event) ->
    @queryForCliente event.target.value

  identificacionKeyUpped: (event) ->
    value = event.target.value
    if value.length is 10 or value.length is 13
      @queryForCliente value

# inherited events
  didInsertElement: ->
    @_super()
    @$(".identificacion_input").on("keyup" , $.proxy(@identificacionKeyUpped, @))
                               .on("change", $.proxy(@identificacionChanged, @))
  
  willDestroyElement: ->
    @_super()
    @$(".identificacion_input").off("keyup").off("change")

  