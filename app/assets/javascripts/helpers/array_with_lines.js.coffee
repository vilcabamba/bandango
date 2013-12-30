Ember.Handlebars.helper "array_with_lines", (value, options) ->
  new Handlebars.SafeString(value.join("<br />")) if value
