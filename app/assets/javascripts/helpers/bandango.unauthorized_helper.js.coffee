window.bandangoUnauthorizedHelper = ->
  $(document).ajaxError (event, request, settings) ->
    Bandango.currentSession.logOut() if request.status == 401
