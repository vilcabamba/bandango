# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @route "dashboard"
  @resource "me", ->
    @route "index", path: "/"
    @route "edit"
  @resource "facturas", ->
    @route "index", path: "/"
    @route "new"
  @resource "ventas", ->
    @route "index", path: "/"
  @resource "clientes", ->
    @route "index", path: "/"
    @route "new"
    @route "show", path: "/:cliente_id"
    @route "edit", path: "/:cliente_id/edit"
  @resource "users", ->
    @route "index", path: "/"
    @route "new"
    @route "show", path: "/:user_id"
    @route "edit", path: "/:user_id/edit"
