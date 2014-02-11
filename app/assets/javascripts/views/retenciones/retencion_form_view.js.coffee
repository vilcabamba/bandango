Bandango.RetencionFormView = Ember.View.extend Bandango.RetencionFuenteOnFormMixin,
  templateName: "retenciones/form"

  model: (->
    compra = @get("controller.model")
    store = @get("controller.store")
    store.createRecord("retencion", compra: compra)
  ).property("controller.model")
