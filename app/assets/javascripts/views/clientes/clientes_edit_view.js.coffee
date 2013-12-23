Bandango.ClientesEditView = Bandango.ModelBackedView.extend
  tiposIds: ["RUC", "Cédula", "Otro"]
  templateName: "clientes/new"
  modelBinding: "controller.model"

  # attributes:
  tipoId: (->
    @get("model").get("tipoId")
  ).property()
  identificacion: (->
    @get("model").get("identificacion")
  ).property()
  nombres: (->
    @get("model").get("nombres")
  ).property()
  direccion: (->
    @get("model").get("direccion")
  ).property()
  telefono: (->
    @get("model").get("telefono")
  ).property()
  email: (->
    @get("model").get("email")
  ).property()

  submit: ->
    console.log "update cliente!"
