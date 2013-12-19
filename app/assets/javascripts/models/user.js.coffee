Bandango.User = Ember.Object.extend

  firstNames: (->
    nombres = @get("nombres")
    Ember.debug "computing user's firstNames"
    unless nombres
      return @get("username")
    if nombres.split(" ").length > 2
      nombres.split(" ").slice(0, 2).join " "
    else
      @get("nombres")
  ).property("nombres")

  imagen_url_small: (->
    @get("imagen_url") + "?s=200"
  ).property("imagen_url")
