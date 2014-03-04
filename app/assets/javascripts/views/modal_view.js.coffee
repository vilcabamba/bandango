Bandango.ModalView = Ember.View.extend
  layoutName: "modal"

  didInsertElement: ->
    @$modal = @$(".modal")
    @$modal.modal()
    @$modal.on "hidden.bs.modal", =>
      @destroy()

  willDestroyElement: ->
    if @get("parentView")
      Ember.debug "calling modal's parentView #willDestroyElement"
      @get("parentView").willDestroyElement()
    Ember.debug "removing modal event handler"
    @$modal.off "hidden.bs.modal"

  actions:
    close: ->
      @$(".close").trigger "click"
