Bandango.ItemBaseMixin = Ember.Mixin.create
  ivaZero: (->
    return 0 if @get("iva")
    @get("base")
  ).property("base", "iva")

  ivaTwelve: (->
    return 0 unless @get("iva")
    @get("base") * (@get("ivaTarifa") / 100)
  ).property("base", "iva", "ivaTarifa")

  iceTotal: (->
    return 0 unless @get("ice")
    @get("base") * (@get("iceTarifa") / 100)
  ).property("base", "ice", "iceTarifa")

  totalPrice: (->
    price = @get("base")
    if @get("iva")
      price += @get("ivaTwelve")
    if @get("ice")
      price += @get("iceTotal")
    price
  ).property("base", "iva", "ivaTarifa", "ice", "iceTarifa")
