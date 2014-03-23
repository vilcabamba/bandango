Bandango.CierreCajaSerializer = Bandango.ApplicationSerializer.extend
  embeddedAssociations: ["cashDenominationItems"]

  serialize: (record, options) ->
    json = {}
    json["retiro"] = Bandango.numberForCurrencyHelper(record.get("retiro"))
    record.eachRelationship (name, relationship) =>
      if relationship.kind == "hasMany"
        @serializeHasMany record, json, relationship
    json
