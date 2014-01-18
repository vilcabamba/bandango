class EmisorSerializer < ActiveModel::Serializer

  attributes :id,
             :razon_social,
             :nombre_comercial,
             :direccion_matriz,
             :direccion_establecimiento,
             :codigo_establecimiento,
             :codigo_punto_emision,
             :contribuyente_especial_numero_resolucion,
             :obligado_a_llevar_contabilidad

end
