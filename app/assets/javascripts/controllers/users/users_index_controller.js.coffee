Bandango.UsersIndexController = Ember.PaginationController.extend
  sortProperties: "firstNames".w()

  modelInfo:
    store: "user"
    class: Bandango.User
