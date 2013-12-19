class UserSerializer < ActiveModel::Serializer
  root false
  
  attributes :id,
             :nombres,
             :username,
             :email,
             :imagen_url,
             :token

end
