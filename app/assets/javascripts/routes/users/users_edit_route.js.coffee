Bandango.UsersEditRoute = Bandango.AuthenticationRequiredRoute.extend
  afterModel: (user) ->
    unless user.get("active")
      alertify.log "No puedes editar un usuario inactivo"
      @transitionTo "users.index"
