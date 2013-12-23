Bandango.PersonImagen = Ember.Mixin.create

  imagen_url_mini: (->
    @imagen_url_with_size 100
  ).property("imagen_url")
  
  imagen_url_small: (->
    @imagen_url_with_size 200
  ).property("imagen_url")

  imagen_url_with_size: (size) ->
    @get("imagen_url") + "&s=#{size}" if @get("imagen_url")
