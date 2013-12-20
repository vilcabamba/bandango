Bandango.User = Ember.Object.extend( Ember.Validations, {
  validations: {
    nombres: {
      presence: true
    }
  }
  firstNames: (->
    if @get("nombres")
      nombres = @get("nombres").split(" ")
      Ember.debug "computing user's firstNames"
      if nombres.length > 2
        nombres.slice(0, 2).join " "
      else
        @get("nombres")
    else
      nombres = @get("username")
    ).property("nombres")


  imagen_url_small: (->
    @get("imagen_url") + "?s=200"
  ).property("imagen_url")
});