fourOhFour = ->
  applicationController = Bandango.__container__.lookup("controller:application")
  currentPath = applicationController.get("currentPath")
  applicationController.transitionToRoute "missing", currentPath

window.bandangoReadyHelper = ->
  # hide spinner icon
  $("#loading_bandango").remove()

  # listen for ajax errors
  $(document).ajaxError (event, request, settings) ->
    switch request.status
      when 401
        Bandango.currentSession.logOut()
      when 404
        fourOhFour()
