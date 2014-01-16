Bandango.OrderItemBaseMixin = Ember.Mixin.create
  descripcion: (->
    @get("cachedItemNombre") || @get("item.nombre")
  ).property("cachedItemNombre", "item.descripcion")

  valorUnitarioVenta: (->
    valorUnitario = @get("cachedItemPrecio") || @get("item.baseVenta")
    @set "valorUnitario", valorUnitario
    valorUnitario
  ).property("cachedItemPrecio", "item.baseVenta")

  valorUnitarioCompra: (->
    valorUnitario = @get("cachedItemPrecio") || @get("item.baseCompra")
    @set "valorUnitario", valorUnitario
    valorUnitario
  ).property("cachedItemPrecio", "item.baseCompra")

  valorTotal: (->
    @get("cantidad") * @get("valorUnitario")
  ).property("item.base", "cantidad")
