Bandango.CategoriasIndexController = Ember.PaginationController.extend
  sortProperties: "nombre".w()

  modelInfo:
    store: "category"
    class: Bandango.Category
