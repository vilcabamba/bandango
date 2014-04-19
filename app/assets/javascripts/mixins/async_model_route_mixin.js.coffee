Bandango.AsyncModelRouteMixin = Ember.Mixin.create
  fetchAsyncModel: ->
    modelName = @get("asyncModel")
    @controller.set "isFetching", true
    @controller.get("store").findAll(modelName).then (model) =>
      @controller.set "isFetching", false
      @controller.set "model", model

  setupController: (@controller, model) ->
    @controller.set("model", model) if model
    Ember.run.later(@, @fetchAsyncModel, 0) if @get("asyncModel")
