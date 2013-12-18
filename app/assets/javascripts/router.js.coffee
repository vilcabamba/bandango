# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @resource "facturas", ->
    @route "index", path: "/"

