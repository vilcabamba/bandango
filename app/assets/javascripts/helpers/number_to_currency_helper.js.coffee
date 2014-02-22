Bandango.numberForCurrencyHelper = (number) ->
  # returns a float of two decimals (to use on currencies)
  parseFloat number.toFixed(2), 10

Bandango.numberToCurrencyHelper = (number) ->
  accounting.formatMoney number, "$ "

Ember.Handlebars.helper "number_to_currency", (number) ->
  Bandango.numberToCurrencyHelper number
