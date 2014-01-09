# labelClickHelper
$(document).on "click", "label", ->
  $("input[name='#{@attributes["for"]["value"]}']").trigger "click"
