Bandango.ClienteSearchResultView = Ember.View.extend
  templateName: "clientes/search_result"
  classNames: "result".w()
  classNameBindings: "active".w()

  active: (->
    @get("parentView.currentClient.id") == @get("cliente.id")
  ).property("parentView.currentClient")

  didInsertElement: ->
    @$().on "click", (e) =>
      @get("parentView.parentView").selectCliente @get("cliente")

  willDestroyElement: ->
    @$().off "click"
