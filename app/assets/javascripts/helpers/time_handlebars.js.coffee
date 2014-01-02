humanizeTimeFormatHelper =
  formats:
    short: "MMM D, YYYY"
    long: "MMMM DD, YYYY h:m a"

  format: (name) ->
    if name and format = @formats[name]
      format
    else
      @formats.short

Ember.Handlebars.helper "humanize_time", (value, options) ->
  format = humanizeTimeFormatHelper.format(options.hash.format)
  moment(value).format format
