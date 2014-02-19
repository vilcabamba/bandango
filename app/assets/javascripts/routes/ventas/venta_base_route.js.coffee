Bandango.VentaBaseRoute = Bandango.OrderableBaseRoute.extend
  actions:
    willTransition: (transition) ->
      model = @get("controller.model")
      if model.get("isDirty")
        model.rollback()
      model.rollbackAssociations()
