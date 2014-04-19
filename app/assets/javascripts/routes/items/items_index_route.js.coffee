Bandango.ItemsIndexRoute = Bandango.AuthenticationRequiredRoute.extend
  asyncModel: true
  cachedModels: {}

  # Following properties are volatile because I don't know how to reference
  # dependence for items' route model
  categoryId: (->
    @modelFor("items").get("id")
  ).property().volatile()

  asyncModelPromise: (->
    @get("store").find "item", category_id: @get("categoryId")
  ).property().volatile()

  model: ->
    @cachedModels[@get("categoryId")] || []

  asyncModelFetched: (model) ->
    @cachedModels[@get("categoryId")] = model
    @_super(model)
