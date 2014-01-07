Bandango.OrderItemBaseMixin = Ember.Mixin.create
  descripcion: (->
    @get("cachedItemNombre") || @get("item.nombre")
  ).property("cachedItemNombre", "item.descripcion")

  valorUnitario: (->
    @get("cachedItemPrecio") || @get("item.base")
  ).property("cachedItemPrecio", "item.base")

  valorTotal: (->
    @get("cantidad") * @get("valorUnitario")
  ).property("item.base", "cantidad")
