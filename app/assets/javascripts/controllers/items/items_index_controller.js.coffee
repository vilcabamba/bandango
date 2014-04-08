Bandango.ItemsIndexController = Ember.PaginationController.extend
  needs: "items"
  sortProperties: "nombre".w()

  modelInfo:
    store: "item"
    class: Bandango.Item
