Bandango.User = Ember.Object.extend( Ember.Validations, {
  validations: {
    nombres: {
      presence: true
    }
  }

  firstNames: (->
    nombres = @get("nombres")
    unless nombres
      return @get("username")
    if nombres.split(" ").length > 2
      nombres.split(" ").slice(0, 2).join " "
    else
      nombres
    ).property("nombres")


  imagen_url_small: (->
    @get("imagen_url") + "?s=200"
  ).property("imagen_url")
});
