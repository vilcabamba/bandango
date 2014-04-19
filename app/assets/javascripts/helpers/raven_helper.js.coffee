class RavenHelper
  constructor: ->
    uri = "https://1da8975b1f0545d488383d13e836861c@tambo.shiriculapo.com/2"
    Raven.config(uri).install()

  logIn: (userProperties) ->
    Raven.setUser userProperties

  logOut: ->
    Raven.setUser()

Bandango.ravenHelper = new RavenHelper()
