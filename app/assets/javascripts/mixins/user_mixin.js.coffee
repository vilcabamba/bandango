Bandango.UserMixin = Ember.Mixin.create
  firstNames: (->
    unless nombres = @get("nombres")
      return @get("username")
    if nombres.split(" ").length > 2
      nombres.split(" ").slice(0, 2).join " "
    else
      nombres
  ).property("nombres")
