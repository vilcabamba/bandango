class UserSerializer < ActiveModel::Serializer
  root false
  
  attributes :id,
             :nombres,
             :username,
             :imagen_url,
             :token

end
