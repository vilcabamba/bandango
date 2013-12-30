Bandango.UserMixin = Ember.Mixin.create
  firstNames: (->
    unless nombres = @get("nombres")
      return @get("username")
    if nombres.split(" ").length > 2
      nombres.split(" ").slice(0, 2).join " "
    else
      nombres
  ).property("nombres")

  isCurrentUser: (->
    parseInt(@get("id"), 10) == Bandango.currentSession.get("user").get("id") and this != Bandango.currentSession.get("user")
  ).property()
