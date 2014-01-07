Bandango.numberToCurrencyHelper = (number) ->
  accounting.formatMoney number, "$ "

Ember.Handlebars.helper "number_to_currency", (number) ->
  Bandango.numberToCurrencyHelper number
