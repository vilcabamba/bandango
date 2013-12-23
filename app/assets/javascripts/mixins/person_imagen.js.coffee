Bandango.PersonImagen = Ember.Mixin.create

  imagen_hexdigest_and_default: (->
    Bandango.GravatarImagenHelper.hexdigestAndDefault(@get("email"))
  ).property("email")

  imagen_url: (->
    Bandango.GravatarImagenHelper.imagenUrlWithDigestAndDefault @get("imagen_hexdigest_and_default")
  ).property("imagen_hexdigest_and_default")

  imagen_url_mini: (->
    @imagen_url_with_size 100
  ).property("imagen_hexdigest_and_default")
  
  imagen_url_small: (->
    @imagen_url_with_size 200
  ).property("imagen_hexdigest_and_default")

  imagen_url_with_size: (size) ->
    Bandango.GravatarImagenHelper.imagenUrlWithSize @get("imagen_url"), size
