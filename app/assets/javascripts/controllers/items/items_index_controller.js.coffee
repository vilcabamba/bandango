Bandango.ItemsIndexController = Ember.PaginationController.extend
  needs: "items"
  modelInfo:
    store: "item"
    class: Bandango.Item
