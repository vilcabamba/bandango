# For more information see: http://emberjs.com/guides/routing/

Bandango.Router.map ()->
  @route "login"
  @route "dashboard"
  @resource "me", ->
    @route "index", path: "/"
    @route "edit"
  @resource "ventas", ->
    @route "index", path: "/"
    @route "new"
    @route "show", path: "/:venta_id"
    @route "edit", path: "/:venta_id/edit"
  @resource "compras", ->
    @route "index", path: "/"
    @route "new"
    @route "show", path: "/:compra_id"
    @route "edit", path: "/:compra_id/edit"
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
  @resource "preferencias", ->
    @route "index", path: "/"
    @route "edit"
  @resource "categorias", ->
    @route "index", path: "/"
    @route "new"
    @resource "items", path: "/:category_id", ->
      @route "index", path: "/"
      @route "new"
      @route "show", path: "/:item_id"
      @route "edit", path: "/:item_id/edit"

