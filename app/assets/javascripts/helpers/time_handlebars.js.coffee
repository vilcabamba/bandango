Bandango.humanizeTimeFormatHelper =
  formats:
    short: "MMM D, YYYY"
    short_full: "DD-MM-YYYY HH:mm"
    long: "DD MMMM YYYY h:m a"

  format: (name) ->
    if name and format = @formats[name]
      format
    else
      @formats.short

  humanize: (value, formatName) ->
    format = Bandango.humanizeTimeFormatHelper.format(formatName)
    moment(value).format format

Ember.Handlebars.helper "humanize_time", (value, options) ->
  Bandango.humanizeTimeFormatHelper.humanize value, options.hash.format
