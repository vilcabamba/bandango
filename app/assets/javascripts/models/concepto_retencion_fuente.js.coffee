Bandango.ConceptoRetencionFuente = DS.Model.extend
  codigo:      DS.attr()
  concepto:    DS.attr()
  porcentaje:  DS.attr()

  retenciones: DS.hasMany("retencion")

  porcentajeWithParenthesis: (->
    porcentaje = @get("porcentaje")
    "(#{porcentaje}%)" unless Ember.isEmpty(porcentaje)
  ).property("porcentaje")

  to_s: (->
    "#{@get("codigo")} - #{@get("concepto")} #{@get("porcentajeWithParenthesis")}"
  ).property("codigo", "concepto", "porcentajeWithParenthesis")
