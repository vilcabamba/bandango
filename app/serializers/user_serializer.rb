class UserSerializer < ActiveModel::Serializer

  attributes :id,
             :username,
             :email,
             :nombres,
             :active

end
