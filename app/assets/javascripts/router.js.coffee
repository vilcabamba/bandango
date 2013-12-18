# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @resource "me", ->
    @route "index", path: "/"
    @route "edit"
  @resource "facturas", ->
    @route "index", path: "/"

