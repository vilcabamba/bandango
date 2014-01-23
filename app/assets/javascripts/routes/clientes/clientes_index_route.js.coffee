Bandango.ClientesIndexRoute = Bandango.AuthenticationRequiredRoute.extend

  fetchClientes: ->
    @controller.get("store").findAll("cliente").then (clientes) =>
      @controller.set "model", clientes

  setupController: (@controller) ->
    Ember.run.later @, @fetchClientes, 0
