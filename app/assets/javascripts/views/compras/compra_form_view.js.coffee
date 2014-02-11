Bandango.CompraFormView = Bandango.OrderableFormView.extend Bandango.SustentoTributarioOnFormMixin,
  clienteSaved: ->
    @saveCompra()

# compra
  failureSavingCompra: (response) ->
    @get("model").rollback()
    @failureCallback response

  compraSaved: (compra) ->
    @modelSaved(compra)
    @get("controller").transitionToRoute "compras.show", compra.get("id")

  saveCompra: ->
    @get("model").save().then $.proxy(@compraSaved, @), $.proxy(@failureSavingCompra, @)

# events
  submit: ->
    @emptyErrors()
    @saveCliente()
    @set "submitting", true
    false
