Bandango.SustentoTributarioOnFormMixin = Ember.Mixin.create
  sustentoTributarioComprobantes: (->
    Bandango.sustentoTributarioComprobantesHelper.comprobantes
  ).property()

  sustentoTributarioSelectChanged: (e) ->
    @get("controller.store").find("sustentoComprobante", e.target.value).then (sustentoTributario) =>
      @set "model.sustentoComprobante", sustentoTributario

  didInsertElement: ->
    @_super()
    $select = @$(".sustento_tributario_select")
    if @get("model") and id = @get("model.sustentoComprobante.id")
      $select.val id
    $select.chosen().on("change", $.proxy(@sustentoTributarioSelectChanged, @)).trigger("change")

  willDestroyElement: ->
    @_super()
    @$(".sustento_tributario_select").chosen("destroy").off("change")

  failureCallback: ->
    @$(".sustento_tributario_select").trigger "change"
    @_super.apply @, arguments
