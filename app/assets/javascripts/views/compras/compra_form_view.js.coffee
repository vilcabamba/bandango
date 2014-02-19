Bandango.CompraFormView = Bandango.OrderableFormView.extend Bandango.SustentoTributarioOnFormMixin,
  attributesForCompra: ["numeroSerieEstablecimiento", "numeroSeriePuntoEmision", "numeroSerieComprobante", "fechaEmision", "fechaRegistro", "autorizacionComprobante"]

  clienteSaved: ->
    @saveCompra()

# compra
  failureSavingCompra: (response) ->
    @failureSaving "compra"
    @failureCallback response

  compraSaved: (compra) ->
    @modelSaved()
    @get("controller").transitionToRoute "compras.show", compra.get("id")

  saveCompra: ->
    compra = @get("model")
    compra.setProperties @getFormDataFor("compra")
    compra.save().then $.proxy(@compraSaved, @), $.proxy(@failureSavingCompra, @)
