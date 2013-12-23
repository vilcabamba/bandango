Bandango.GravatarImagenOnForm = Ember.Mixin.create
  
  imagen_url_small: (->
    Bandango.GravatarImagenHelper.imagenUrlWithOptions email: @get("email"), size: 200
  ).property("email")
