Bandango.UserFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  attributes: ["nombres", "username", "email", "password", "password_confirmation"]

# callbacks
  successCallback: (user, action) ->
    @_super "#{user.get("firstNames")} #{action}"
    @get("controller").transitionToRoute "users.show", user.get("id")

# inherited events
  didInsertElement: ->
    @$(".profile_image").popover()

  willDestroyElement: ->
    @$(".profile_image").popover "destroy"
