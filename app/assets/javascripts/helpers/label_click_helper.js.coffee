# labelClickHelper
$(document).on "click", "label", ->
  if @attributes["for"]
    $("input[name='#{@attributes["for"]["value"]}']").focus().trigger "click"
