Bandango.ClientesIndexRoute = Bandango.AuthenticationRequiredRoute.extend

  fetchClientes: ->
    @controller.set "isFetching", true
    @controller.get("store").findAll("cliente").then (clientes) =>
      @controller.set "isFetching", false
      @controller.set "model", clientes

  setupController: (@controller) ->
    Ember.run.later @, @fetchClientes, 0
