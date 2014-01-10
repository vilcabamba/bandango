Bandango.ItemsIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    category = @modelFor "items"
    @get("store").find "item", category_id: category.get("id")
