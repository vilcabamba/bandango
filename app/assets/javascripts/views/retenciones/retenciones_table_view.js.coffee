Bandango.RetencionesTableView = Bandango.TableView.extend
  templateName: "retenciones/table"

  showDivider: (->
    @get("includeForm") and @get("controller.model.persistedRetenciones.length") > 0
  ).property("controller.model.persistedRetenciones.length")
