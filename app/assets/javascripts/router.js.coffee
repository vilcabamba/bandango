# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @resource "me", ->
    @route "index", path: "/"
    @route "edit"
  @resource "facturas", ->
    @route "index", path: "/"
    @route "new"
  @resource "clientes", ->
    @route "index", path: "/"
    @route "new"
