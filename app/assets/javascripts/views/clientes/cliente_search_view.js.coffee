Bandango.ClienteSearchView = Ember.View.extend
  templateName: "clientes/search"
  classNames: "cliente-search-modal".w()

# results methods:
  selectCliente: (cliente) ->
    @set "modalView.currentClient", cliente

  noResults: (->
    not (@get("modalView.clientes.length") > 0) and not @get("queryEmpty") and not @get("modalView.queryingCliente")
  ).property("modalView.clientes", "modalView.queryingCliente", "query")

  queryEmpty: (->
    Ember.isEmpty @get("query")
  ).property("query")

# search methods:
  initializeSearchListener: ->
    @$clienteSearchQuery = @$("#cliente-search-query")
    @$clienteSearchQuery.on "keyup search", $.proxy(@searchQueryChanged, @)

  gotClientes: (clientes) ->
    @set "modalView.queryingCliente", false
    @set "modalView.clientes", clientes
    @set "modalView.currentClient", clientes.get("firstObject")

  searchQueryChanged: (e) ->
    query = $.trim(e.target.value)
    if Ember.isEmpty(query)
      @stopCurrentScheduledSearch()
      @gotClientes []
    else if query != @get("query")
      @scheduleSearch()
    @set "query", query

  stopCurrentScheduledSearch: ->
    if @currentScheduledId
      clearTimeout @currentScheduledId
      @currentScheduledId = null

  scheduleSearch: ->
    @set "modalView.queryingCliente", true
    @stopCurrentScheduledSearch()
    @currentScheduledId = setTimeout $.proxy(@doSearch, @), 300

  doSearch: ->
    @get("controller.store").find("cliente", search: @get("query")).then($.proxy(@gotClientes, @))

# select button methods:
  currentClientChanged: (->
    if @get("modalView.currentClient")
      @$selectButton.removeClass "disabled"
    else
      @$selectButton.addClass "disabled"
  ).observes("modalView.currentClient")

  chooseClient: ->
    client = @get("modalView.currentClient")
    parentView = @get("parentView")
    parentView.set "model.cliente", client
    parentView.set "identificacion", client.get("identificacion")
    parentView.clienteChanged()

  createAndAppendSelectButton: ->
    @$selectButton = $("<button />", class: "btn disabled btn-primary", text: "Seleccionar", "data-dismiss": "modal")
    @$selectButton.on "click", $.proxy(@chooseClient, @)
    @$(".modal-footer").append @$selectButton

# lifecyle methods:
  didInsertElement: ->
    @createAndAppendSelectButton()
    @set "modalView", @get("childViews.firstObject")
    @initializeSearchListener()

  willDestroyElement: ->
    @$clienteSearchQuery.off "keyup search"
    @$selectButton.off "click"
    Ember.debug "removing ClienteSearchView handlers"
