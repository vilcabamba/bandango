class CurrentUserSerializer < UserSerializer
  root false

  attributes :token

end
