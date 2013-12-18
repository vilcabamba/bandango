Bandango.User = Ember.Object.extend
  imagen_url_small: (->
    @get("imagen_url") + "?s=200"
  ).property("imagen_url")
