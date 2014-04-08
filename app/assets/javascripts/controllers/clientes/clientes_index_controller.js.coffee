Bandango.ClientesIndexController = Ember.PaginationController.extend
  sortProperties: "nombres".w()

  modelInfo:
    store: "cliente"
    class: Bandango.Cliente
