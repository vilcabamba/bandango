get = Ember.get
Bandango.OrderableSerializer = DS.ActiveModelSerializer.extend
  embeddedAssociations: ["orderItems", "retenciones"]

  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    if key in @get("embeddedAssociations")
      json["#{key.decamelize()}_params"] = get(record, key).map (relationship) -> relationship.serialize()
    null
