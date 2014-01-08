Bandango.jsonCamelizedReviverHelper = (key, val) ->
  if key
    this[key.camelize()] = val
  else
    return val
