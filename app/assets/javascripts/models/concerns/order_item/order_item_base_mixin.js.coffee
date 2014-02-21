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

# price
  priceFor: (orderType) ->
    if (cachedItemPrecio = @get("cachedItemPrecio"))
      @get("cantidad") * cachedItemPrecio
    else
      @get("cantidad") * @get("item.base#{orderType}")

  priceCompra: (-> @priceFor("Compra") )
  .property("cachedItemPrecio", "cantidad", "item.baseCompra")
  priceVenta: (-> @priceFor("Venta") )
  .property("cachedItemPrecio", "cantidad", "item.baseVenta")

# totalPrice
  totalPriceFor: (orderType) ->
    price = @get("price#{orderType}")
    price += @get("ivaTwelve#{orderType}")
    price += @get("ice#{orderType}")
    price

  totalPriceCompra: (-> @totalPriceFor("Compra") )
  .property("priceCompra")

  totalPriceVenta: (-> @totalPriceFor("Venta") )
  .property("priceVenta")

# ivaZero
  ivaZeroFor: (orderType) ->
    return 0 if @get("item.iva") or @get("item.ice")
    @get("price#{orderType}") * (@get("item.iceTarifa") / 100)
  ivaZeroCompra: (-> @ivaZeroFor("Compra") )

  ivaZeroCompra: (-> @ivaZeroFor("Compra") )
  .property("item.iva", "item.ice", "priceCompra", "item.iceTarifa")

  ivaZeroVenta: (-> @ivaZeroFor("Venta") )
  .property("item.iva", "item.ice", "priceVenta", "item.iceTarifa")

# ivaTwelve
  ivaTwelveFor: (orderType) ->
    return 0 unless @get("item.iva")
    @get("price#{orderType}") * (@get("item.ivaTarifa") / 100)

  ivaTwelveCompra: (-> @ivaTwelveFor("Compra") )
  .property("item.iva", "priceCompra", "item.ivaTarifa")

  ivaTwelveVenta: (-> @ivaTwelveFor("Venta") )
  .property("item.iva", "priceVenta", "item.ivaTarifa")

# ice
  iceFor: (orderType) ->
    return 0 unless @get("item.ice")
    @get("price#{orderType}") * (@get("item.iceTarifa") / 100)

  iceCompra: (-> @iceFor("Compra") )
  .property("item.ice", "priceCompra", "item.iceTarifa")

  iceVenta: (-> @iceFor("Venta") )
  .property("item.ice", "priceVenta", "item.iceTarifa")
