Bandango.ClientesSearchView = Ember.TextField.extend
  type: "search"
  placeholder: "Buscar"
  classNames: "form-control breadcrumb-search-filter"

  valueChanged: (->
    @get("controller").send "search", $.trim(@get("value"))
  ).observes("value")
