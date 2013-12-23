Bandango.ClienteFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

  attributes: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  successCallback: (cliente, action) ->
    @_super "#{cliente.get("nombres")} #{action}"
    @get("controller").transitionToRoute "clientes.show", cliente.get("id")
