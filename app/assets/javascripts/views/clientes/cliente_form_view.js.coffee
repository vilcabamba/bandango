Bandango.ClienteFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin,

  successCallback: (cliente, action) ->
    @_super "#{cliente.get("nombres")} #{action}"
    @get("controller").transitionToRoute "clientes.show", cliente.get("id")
