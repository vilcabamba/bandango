Bandango.ClienteOnFormMixin = Ember.Mixin.create
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]
  attributesForCliente: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  queryForClienteOnIdentificacionChange: false

# view events
  clienteChanged: ->
    Ember.debug "cliente changed"
    cliente = @get("model.cliente") || Ember.Object.create()
    attributes = ["tipoId", "nombres", "direccion", "telefono", "email"]
    for attribute in attributes
      @set attribute, cliente.get(attribute)

# query callbacks
  gotClientes: (clientes) ->
    @setProperties
      isFetchingCliente: false
      "model.cliente": clientes.get("firstObject")

  didNotGetCliente: ->
    @setProperties
      isFetchingCliente: false
      cliente: null

  triggerClienteChange: ->
    @clienteChanged()

# query methods
  queryForCliente: (identificacion) ->
    unless @get("currentClienteId") == identificacion
      @setProperties
        isFetchingCliente: true
        currentClienteId: identificacion
      store = @get("controller").get("store")
      store.find("cliente", identificacion: identificacion).then($.proxy(@gotClientes, @), $.proxy(@didNotGetCliente, @)).finally($.proxy(@triggerClienteChange, @))

# input callbacks
  identificacionChanged: (event) ->
    @queryForCliente event.target.value

  identificacionKeyUpped: (event) ->
    value = event.target.value
    if value.length is 10 or value.length is 13
      @queryForCliente value

# chosen
  applyChosen: ->
    @$(".tiposIdsSelect").chosen disable_search: true
    @observeChosen()

  observeChosen: (->
    $select = @$(".tiposIdsSelect")
    identificacion = @get("identificacion") || ""
    tipoId = switch identificacion.length
      when 10
        "Cédula"
      when 13
        "RUC"
      else
        "Pasaporte - otro"
    $select.val tipoId
    $select.trigger "chosen:updated"
  ).observes("identificacion")

  destroyChosen: ->
    @$(".tiposIdsSelect").chosen("destroy")

# actions
  actions:
    searchCliente: ->
      # Bandango.ClienteSearchComponent.create().appendTo "body"
      Bandango.ClienteSearchView.create(container: @get("container"), controller: @get("controller")).append()

# inherited events
  didInsertElement: ->
    @_super()
    @applyChosen()
    if @get("queryForClienteOnIdentificacionChange")
      @$(".identificacion_input").on("keyup" , $.proxy(@identificacionKeyUpped, @))
                                 .on("change", $.proxy(@identificacionChanged, @))

  willDestroyElement: ->
    @_super()
    @destroyChosen()
    if @get("queryForClienteOnIdentificacionChange")
      @$(".identificacion_input").off("keyup").off("change")
