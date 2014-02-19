Bandango.ClienteFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm, Bandango.ClienteOnFormMixin,
  attributesBinding: "attributesForCliente"

  successCallback: (cliente, action) ->
    @_super "#{cliente.get("nombres")} #{action}"
    @get("controller").transitionToRoute "clientes.show", cliente.get("id")
