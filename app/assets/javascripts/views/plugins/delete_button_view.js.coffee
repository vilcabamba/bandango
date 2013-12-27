Bandango.DeleteButtonView = Ember.View.extend
  layoutName: "plugins/delete_button"
  tagName: "div"
  classNames: ["inline_block"]
  classes: "btn btn-danger"
  deletingText: "Eliminando"
  waitingText: ""
  waitingTextPredicate: ".."

  showFirstPart: ->
    @$(".first").removeClass "hidden"
    @$(".last").addClass "hidden"
    null

  showLastPart: ->
    @$(".first").addClass "hidden"
    @$(".last").removeClass "hidden"
    null

  onTick: (seconds) ->
    @set "remainingSeconds", seconds
    null

  onComplete: ->
    @get("parentView").send(@get("action"))
    @showFirstPart()
    @$(".first a").button("loading")
    setTimeout =>
      if $btn = @$(".first a")
        $btn.button("reset")
    , 2000
    null

  start: ->
    @showLastPart()
    @countdown = new Countdown(3, $.proxy(@onTick, @), $.proxy(@onComplete, @))
    false

  abortCountdown: ->
    @countdown.abort()
    @showFirstPart()
    false

  didInsertElement: ->
    @$(".delete_button").on "click", $.proxy(@start, @)
    @$(".cancel_trigger").on("click", $.proxy(@abortCountdown, @))
                         .tooltip()

  willDestroyElement: ->
    @$(".delete_button").off "click"
    @$(".cancel_trigger").off("click")
                         .tooltip("destroy")
