Bandango.gravatarImagenHelper =
  hexdigestAndDefault: (email) ->
    if Ember.isEmpty(email)
      ["a", "mm"]
    else
      [hex_md5(email), "identicon"]

  imagenUrlWithDigestAndDefault: (digest_and_default) ->
    "http://www.gravatar.com/avatar/#{digest_and_default[0]}?d=#{digest_and_default[1]}"

  imagenUrlWithSize: (url, size) ->
    url + "&s=#{size}"

  imagenUrlWithOptions: (options) ->
    default_options = {
      email: null
      size: 100
    }
    $.extend default_options, options
    url = @imagenUrlWithDigestAndDefault @hexdigestAndDefault(default_options.email)
    @imagenUrlWithSize url, default_options.size
