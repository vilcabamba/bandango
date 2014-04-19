Bandango.GravatarImagenOnForm = Ember.Mixin.create
  imagen_url_small: (->
    imagen_digest = @get("email")
    if Ember.isEmpty(imagen_digest)
      imagen_digest = @get("identificacion")
    Bandango.gravatarImagenHelper.imagenUrlWithOptions email: imagen_digest, size: 200
  ).property("email", "identificacion")
