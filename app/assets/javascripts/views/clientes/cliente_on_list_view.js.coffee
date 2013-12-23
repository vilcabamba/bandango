Bandango.ClienteOnListView = Ember.View.extend
  
  tagName: "a"
  classNames: "cliente_on_list"
  templateName: "clientes/cliente_on_list"
  attributeBindings: ["href"]

  href: (->
    "#/clientes/#{@get("model").get("id")}"
  ).property()

  click: ->
    console.log "clicked"
