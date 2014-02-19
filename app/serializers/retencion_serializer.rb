class RetencionSerializer < ActiveModel::Serializer

  attributes :id,
             :fecha_emision,
             :numero_autorizacion,
             :numero_serie_establecimiento,
             :numero_serie_punto_emision,
             :numero_serie_secuencial,
             :compra_id,
             :venta_id

  has_one :concepto_retencion_fuente, embed: :ids, include: true

  def compra_id
    object.order_id if object.order_type == "Compra"
  end

  def venta_id
    object.order_id if object.order_type == "Venta"
  end
end
