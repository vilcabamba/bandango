Bandango.ClienteSearchView = Ember.View.extend Bandango.SearchMixin,
  templateName: "clientes/modal_search"
  classNames: "cliente-search-modal".w()

# results methods:
  selectCliente: (cliente) ->
    @set "modalView.currentClient", cliente

# search methods:
  initializeSearchListener: ->
    @$clienteSearchQuery = @$("#cliente-search-query")
    @$clienteSearchQuery.on "keyup search", $.proxy(@searchQueryChanged, @)

  gotResults: (clientes) ->
    @_super(clientes)
    @set "modalView.queryingCliente", false
    @set "modalView.clientes", clientes
    @set "modalView.currentClient", clientes.get("firstObject")

  emptyQuerySearch: ->
    @gotResults []

  searchQueryChanged: (e) ->
    query = $.trim(e.target.value)
    if query != @get("currentQuery")
      @queryChanged query

  scheduleSearch: ->
    @_super()
    @set "modalView.queryingCliente", true

  executeSearch: ->
    @get("controller.store").find("cliente", search: @get("currentQuery")).then($.proxy(@gotResults, @))

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
