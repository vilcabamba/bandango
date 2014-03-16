Bandango.FormasDePagoOnFormMixin = Ember.Mixin.create
  formasDePago: ["Efectivo", "Cheque"]

  didInsertElement: ->
    @_super()
    $select = @$(".forma-de-pago-select")
    $select.val @get("model.formaDePago")
    $select.chosen disable_search: true

  willDestroyElement: ->
    @_super()
    @$(".forma-de-pago-select").chosen "destroy"
