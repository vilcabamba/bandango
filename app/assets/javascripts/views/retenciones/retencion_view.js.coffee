Bandango.RetencionView = Ember.View.extend
  templateName: "retenciones/show"
  includeFormBinding: "parentView.includeForm"
  classNames: ["retencion_show"]

  removeRetencion: ->
    @get("model").deleteRecord()

  didInsertElement: ->
    @$(".glyphicon").on "click", $.proxy(@removeRetencion, @)

  willDestroyElement: ->
    @$(".glyphicon").off "click"
