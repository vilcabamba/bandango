Bandango.CierresCajaIndexController = Ember.PaginationController.extend
  sortProperties: "id".w()
  sortAscending: false

  modelInfo:
    store: "cierreCaja"
    class: Bandango.CierreCaja
