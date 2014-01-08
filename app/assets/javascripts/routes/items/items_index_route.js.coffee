Bandango.ItemsIndexRoute = Ember.Route.extend
  beforeModel: ->
    Bandango.currentSession.requireLogin @

  model: ->
    category = @modelFor "items"
    @get("store").find "item", category_id: category.get("id")
