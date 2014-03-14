Bandango.ClientesSearchController = Ember.ArrayController.extend Bandango.SearchMixin,
  needs: "clientesIndex"

  emptyQuerySearch: ->
    controller = @get("controllers.clientesIndex")
    controller.set "model", @get("originalClientes")
    controller.set "showingSearchResults", false

  gotResults: (clientes) ->
    @set "controllers.clientesIndex.isFetching", false
    @_super clientes
    controller = @get("controllers.clientesIndex")
    unless controller.get("showingSearchResults")
      @set "originalClientes", controller.get("model")
      controller.set "showingSearchResults", true
    controller.set "model", clientes

  executeSearch: ->
    @set "controllers.clientesIndex.isFetching", true
    @get("store").find("cliente", search: @get("currentQuery")).then $.proxy(@gotResults, @)

  actions:
    search: (query) ->
      @queryChanged query
