Bandango.ItemsIndexRoute = Bandango.RequireAuthenticationRoute.extend
  model: ->
    category = @modelFor "items"
    @get("store").find "item", category_id: category.get("id")
