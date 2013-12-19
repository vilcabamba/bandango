class ClienteSerializer < ActiveModel::Serializer
  
  attributes :id,
             :tipo_id,
             :identificacion,
             :nombres,
             :direccion,
             :telefono,
             :email,
             :imagen_url

end
