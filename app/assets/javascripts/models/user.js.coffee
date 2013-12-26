Bandango.User = Ember.Object.extend Ember.Validations, Bandango.PersonImagen, 
  validations: {
    nombres: {
      presence: true
    }
  }

  firstNames: (->
    unless nombres = @get("nombres")
      return @get("username")
    if nombres.split(" ").length > 2
      nombres.split(" ").slice(0, 2).join " "
    else
      nombres
  ).property("nombres")
