class ComprobanteSerializer < ActiveModel::Serializer

  attributes :id,
             :codigo,
             :tipo,
             :codigo_secuenciales,
             :sustento_tributario
end
