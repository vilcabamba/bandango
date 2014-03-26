Bandango.currencyPrefix = "$ "

Bandango.numberForCurrencyHelper = (number=0) ->
  # to float if string
  number = parseFloat number, 10 if number.constructor == String
  # returns a float of two decimals (to use on currencies)
  parseFloat number.toFixed(2), 10

Bandango.numberToCurrencyHelper = (number) ->
  accounting.formatMoney number, Bandango.currencyPrefix

Ember.Handlebars.helper "number_to_currency", (number) ->
  Bandango.numberToCurrencyHelper number
