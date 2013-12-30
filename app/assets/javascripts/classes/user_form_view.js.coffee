Bandango.UserFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
  tagName: "form"
  modelBinding: "controller.model"
  attributes: ["nombres", "username", "email", "password", "password_confirmation"]

# callbacks
  failureEditing: (response) ->
    @failureCallback {errors: response.responseJSON}

# inherited events
  didInsertElement: ->
    @$(".profile_image").popover()

  willDestroyElement: ->
    @$(".profile_image").popover "destroy"
