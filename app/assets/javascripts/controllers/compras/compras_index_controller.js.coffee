#= require controllers/orders/orderable_controller

Bandango.ComprasIndexController = Bandango.OrderableController.extend
  modelInfo:
    store: "compra"
    class: Bandango.Compra
