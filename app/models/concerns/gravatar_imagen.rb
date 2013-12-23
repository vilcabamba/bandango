module GravatarImagen
  def imagen_url
    "http://www.gravatar.com/avatar/#{email_hexdigest_and_default[0]}?d=#{email_hexdigest_and_default[1]}"
  end
  def email_hexdigest_and_default
    # returns the email hexdigest and the default image
    # if user doesn't have email, returns 'a' and *mystery man* as default
    # if user has email, it returns a hexdigest of the email and *identicon* as default image
    @email_hexdigest_and_default ||= if email.blank?
      ["a", "mm"]
    else
      [Digest::MD5.hexdigest(email), "identicon"]
    end
  end
end
