get = Ember.get

Bandango.ApplicationSerializer = DS.ActiveModelSerializer.extend
  embeddedAssociations: []

  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    if key in @get("embeddedAssociations")
      json["#{key.decamelize()}_params"] = get(record, key).map (relationship) -> relationship.serialize()
    null
