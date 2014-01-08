get = Ember.get
Bandango.VentaSerializer = DS.RESTSerializer.extend
  serializeBelongsTo: (record, json, relationship) ->
    key = relationship.key
    json["#{key}_id"] = get(record, key).get("id")

  serializeHasMany: (record, json, relationship) ->
    key = relationship.key
    if key == "orderItems"
      json[key.decamelize()] = get(record, key).map (orderItem) ->
        { cantidad: orderItem.get("cantidad"), item_id: orderItem.get("item.id") }
