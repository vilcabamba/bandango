Bandango.ClienteFormView = Bandango.ModelBackedView.extend
  tiposIds: ["RUC", "Cédula", "Otro"]

  attributes: ["tipoId", "identificacion", "nombres", "direccion", "telefono", "email"]

  successCallback: (cliente, action) ->
    alertify.log "#{cliente.get("nombres")} #{action}"
    @get("controller").transitionToRoute "clientes.show", cliente.get("id")

  failure: (response) ->
    self.setErrors response.erorrs
    self.set "submitting", false
