Bandango.AsyncModelRouteMixin = Ember.Mixin.create
  asyncModelPromise: (->
    @controller.get("store").findAll @get("asyncModel")
  ).property()

  fetchAsyncModel: ->
    @controller.set "isFetching", true
    @get("asyncModelPromise").then $.proxy(@asyncModelFetched, @)

  asyncModelFetched: (model) ->
    @controller.set "isFetching", false
    @controller.set "model", model

  setupController: (@controller, model) ->
    @controller.set("model", model) if model
    Ember.run.later(@, @fetchAsyncModel, 0) if @get("asyncModel")
