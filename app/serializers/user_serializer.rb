class UserSerializer < ActiveModel::Serializer
  root false
  
  attributes :id,
             :nombres,
             :username,
             :email,
             :token

end
