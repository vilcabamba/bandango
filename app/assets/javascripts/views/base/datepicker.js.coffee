Bandango.DateField = Ember.TextField.extend
  attributeBindings: ["value", "format", "readonly", "type", "size", "placeholder", "name"]
  format: "dd/mm/yyyy"

  value: ( ->
    @get("date")
  ).property("date")

  dateChanged: (e) ->
    @set "date", e.date

  didInsertElement: ->
    @$().datepicker( format: @get("format"),
                  autoclose: true,
                   language: "es"
    ).on "changeDate", $.proxy(@dateChanged, @)

  willDestroyElement: ->
    @$().datepicker("remove")
