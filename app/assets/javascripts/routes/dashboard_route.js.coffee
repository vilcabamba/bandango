Bandango.DashboardRoute = Bandango.AuthenticationRequiredRoute.extend
  model: ->
    $.getJSON "/api/stats"
