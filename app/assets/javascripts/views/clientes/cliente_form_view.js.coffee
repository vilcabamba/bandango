Bandango.ClienteFormView = Bandango.ModelBackedView.extend Bandango.GravatarImagenOnForm,
  tiposIds: ["RUC", "Cédula", "Pasaporte - otro"]

  attributes: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  successCallback: (cliente, action) ->
    alertify.log "#{cliente.get("nombres")} #{action}"
    @get("controller").transitionToRoute "clientes.show", cliente.get("id")

  failure: (response) ->
    self.setErrors response.erorrs
    self.set "submitting", false
