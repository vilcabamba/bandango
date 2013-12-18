class UserSerializer < ActiveModel::Serializer
  root false
  
  attributes :id,
             :nombres,
             :imagen_url,
             :token

end
