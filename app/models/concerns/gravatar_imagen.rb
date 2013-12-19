module GravatarImagen
  def imagen_url
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}" unless email.blank?
  end
end
