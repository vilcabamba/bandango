class EmisorSerializer < ActiveModel::Serializer

  attributes :id,
             :ruc,
             :razon_social,
             :nombre_comercial,
             :direccion_matriz,
             :direccion_establecimiento,
             :autorizacion_comprobantes,
             :codigo_establecimiento,
             :codigo_punto_emision,
             :contribuyente_especial_numero_resolucion,
             :obligado_llevar_contabilidad,
             :imagen_url

end
