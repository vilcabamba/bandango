Bandango.ItemBaseMixin = Ember.Mixin.create
  ivaZero: (->
    return 0 if @get("iva")
    @get("base")
  ).property("base", "iva")

  ivaTwelve: (->
    return 0 unless @get("iva")
    @get("base") * (@get("ivaTarifa") / 100)
  ).property("base", "iva", "ivaTarifa")

  totalPrice: (->
    if @get("iva")
      @get("base") + @get("ivaTwelve")
    else
      @get("base")
  ).property("base", "iva", "ivaTarifa", "ice", "iceTarifa")
