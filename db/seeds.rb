# encoding: utf-8
comprobantes = [
  { codigo: 1,
    tipo: "Factura",
    codigo_secuenciales: [1, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 2,
    tipo: "Nota o boleta de venta",
    codigo_secuenciales: [1],
    sustento_tributario: [2, 4, 5, 7, 8, 9, 0] },
  { codigo: 3,
    tipo: "Liquidación de compra de Bienes o Prestación de servicios",
    codigo_secuenciales: [2, 3],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8] },
  { codigo: 4,
    tipo: "Nota de crédito",
    codigo_secuenciales: [1, 2, 3, 4, 5, 6, 7, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 5,
    tipo: "Nota de débito",
    codigo_secuenciales: [1, 2, 3, 4, 5, 6, 7, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7, 8, 9, 0] },
  { codigo: 7,
    tipo: "Comprobante de Retención" },
  { codigo: 8,
    tipo: "Boletos o entradas a espectáculos públicos",
    codigo_secuenciales: [1] },
  { codigo: 9,
    tipo: "Tiquetes o vales emitidos por máquinas registradoras",
    codigo_secuenciales: [1] },
  { codigo: 11,
    tipo: "Pasajes expedidos por empresas de aviación",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 5] },
  { codigo: 12,
    tipo: "Documentos emitidos por instituciones financieras",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 5] },
  { codigo: 15,
    tipo: "Comprobante de venta emitido en el Exterior",
    codigo_secuenciales: [3],
    sustento_tributario: [2, 4, 5, 7] },
  { codigo: 16,
    tipo: "Formulario Único de Exportación (FUE) o Declaración Aduanera Única (DAU) o Declaración Andina de Valor (DAV)",
    codigo_secuenciales: [9] },
  { codigo: 18,
    tipo: "Documentos autorizados utilizados en ventas excepto N/C N/D ",
    codigo_secuenciales: [4, 5, 6, 7] },
  { codigo: 19,
    tipo: "Comprobantes de Pago de Cuotas o Aportes",
    codigo_secuenciales: [1, 2],
    sustento_tributario: [2] },
  { codigo: 20,
    tipo: "Documentos por Servicios Administrativos emitidos por Inst. del Estado",
    codigo_secuenciales: [1],
    sustento_tributario: [2] },
  { codigo: 21,
    tipo: "Carta de Porte Aéreo",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 8] },
  { codigo: 22,
    tipo: "RECAP",
    codigo_secuenciales: [10, 11] },
  { codigo: 23,
    tipo: "Nota de Crédito TC",
    codigo_secuenciales: [10, 11] },
  { codigo: 24,
    tipo: "Nota de Débito TC",
    codigo_secuenciales: [10, 11] },
  { codigo: 41,
    tipo: "Comprobante de venta emitido por reembolso",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 5, 6, 7] },
  { codigo: 42,
    tipo: "Documento agente de retención Presuntiva",
    codigo_secuenciales: [1],
    sustento_tributario: [0] },
  { codigo: 43,
    tipo: "Liquidacion para Explotacion y Exploracion de Hidrocarburos",
    codigo_secuenciales: [1],
    sustento_tributario: [1, 2, 6, 7] },
  { codigo: 44,
    tipo: "Comprobante de Contribuciones y Aportes",
    codigo_secuenciales: [4, 5, 6] },
  { codigo: 45,
    tipo: "Liquidación por reclamos de aseguradoras",
    codigo_secuenciales: [1, 3],
    sustento_tributario: [9] },
  { codigo: 47,
    tipo: "Nota de Crédito por Reembolso Emitida por Intermediario",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 6, 7] },
  { codigo: 48,
    tipo: "Nota de Débito por Reembolso Emitida por Intermediario",
    codigo_secuenciales: [1, 4, 5, 6, 9],
    sustento_tributario: [1, 2, 3, 4, 6, 7] },
  { codigo: 49,
    tipo: "Proveedor Directo de Exportador Bajo Régimen Especial",
    codigo_secuenciales: [4] },
  { codigo: 50,
    tipo: "A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] },
  { codigo: 51,
    tipo: "N/C A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] },
  { codigo: 52,
    tipo: "N/D A Inst. Estado y Empr. Públicas que percibe ingreso exento de Imp. Renta",
    codigo_secuenciales: [4] }
].each do |comprobante|
  Comprobante.where(codigo: comprobante[:codigo]).first_or_initialize.tap do |c|
    c.update_attributes! comprobante
  end
end
if Category.count == 0
  Category.where(id: 1).first_or_initialize.tap do |c|
    c.update_attributes! nombre: "General"
  end
end
sustento_comprobantes = [
  { codigo: 0,
    tipo: "No aplica",
    codigo_tipo_comprobantes: [1, 2, 4, 5, 42] },
  { codigo: 1,
    tipo: "Crédito Tributario para declaración de IVA (servicios y bienes distintos de inventarios y activos fijos)",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 11, 12, 21, 41, 43, 47, 48] },
  { codigo: 2,
    tipo: "Costo o Gasto para declaración de IR (servicios y bienes distintos de inventarios y activos fijos)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 11, 12, 15, 19, 20, 21, 41, 43, 47, 48] },
  { codigo: 3,
    tipo: "Activo Fijo - Crédito Tributario para declaración de IVA",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 41, 47, 48] },
  { codigo: 4,
    tipo: "Activo Fijo - Costo o Gasto para declaración de IR",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 15, 41, 47, 48] },
  { codigo: 5,
    tipo: "Liquidación Gastos de Viaje, hospedaje y alimentación Gastos IR (a nombre de empleados y no de la empresa)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 11] },
  { codigo: 6,
    tipo: "Inventario - Crédito Tributario para declaración de IVA",
    codigo_tipo_comprobantes: [1, 3, 4, 5, 41, 43, 47, 48] },
  { codigo: 7,
    tipo: "Inventario - Costo o Gasto para declaración de IR",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 15, 41, 43, 47, 48] },
  { codigo: 8,
    tipo: "Valor pagado para solicitar Reembolso de Gasto (intermediario)",
    codigo_tipo_comprobantes: [1, 2, 3, 4, 5, 21] },
  { codigo: 9,
    tipo: "Reembolso por Siniestros",
    codigo_tipo_comprobantes: [45, 4, 5] }
].each do |sustento|
  SustentoComprobante.where(codigo: sustento[:codigo]).first_or_initialize.tap do |s|
    s.update_attributes! sustento
  end
end
concepto_retencion_fuentes = [
  { codigo: 303,
    concepto: "Honorarios profesionales" },
  { codigo: 304,
    concepto: "Servicios predomina el intelecto" },
  { codigo: 307,
    concepto: "Servicios predomina la mano de obra" },
  { codigo: 308,
    concepto: "Servicios entre sociedades" },
  { codigo: 309,
    concepto: "Servicios publicidad y comunicación" },
  { codigo: 310,
    concepto: "Servicio transporte privado de pasajeros o servicio público o privado de carga" },
  { codigo: 312,
    concepto: "Transferencia de bienes muebles de naturaleza corporal" },
  { codigo: 319,
    concepto: "Arrendamiento mercantil" },
  { codigo: 320,
    concepto: "Arrendamiento bienes inmuebles" },
  { codigo: 322,
    concepto: "Seguros y reaseguros (primas y cesiones)" },
  { codigo: 323,
    concepto: "Por rendimientos financieros (No aplica para IFIs)" },
  { codigo: "323A",
    concepto: "Por RF: depósitos Cta Corriente" },
  { codigo: "323B1",
    concepto: "Por RF:  depósitos Cta Ahorros Sociedades" },
  { codigo: "323B2",
    concepto: "Por RF:  depósitos Cta Ahorros Persona Natural" },
  { codigo: "323C",
    concepto: "Por rendimientos financieros:  depósitos en cuentas exentas" },
  { codigo: "323D",
    concepto: "Por rendimientos financieros: compra, cancelación o redención de mini bem´s y bem´s" },
  { codigo: "323E",
    concepto: "Por RF: depósito a plazo" },
  { codigo: "323F",
    concepto: "Por rendimientos financieros: operaciones de reporto - repos" },
  { codigo: "323G",
    concepto: "Por RF: inversiones (captaciones)" },
  { codigo: "323H",
    concepto: "Por RF: obligaciones" },
  { codigo: "323I",
    concepto: "Por RF: bonos convertible en acciones" },
  { codigo: "323J",
    concepto: "Por RF: bonos de organismos y gobiernos extranjeros" },
  { codigo: "323K",
    concepto: "Por RF: entre IFI's" },
  { codigo: 325,
    concepto: "Por loterías, rifas, apuestas y similares" },
  { codigo: 327,
    concepto: "Por venta de combustibles a comercializadoras " },
  { codigo: 328,
    concepto: "Por venta de combustibles a distribuidores" },
  { codigo: 332,
    concepto: "Otras compras de bienes y servicios no sujetas a retención" },
  { codigo: 333,
    concepto: "Convenio de Débito o Recaudación" },
  { codigo: 334,
    concepto: "Por compras con tarjeta de crédito" },
  { codigo: 340,
    concepto: "Otras retenciones aplicables el 1%" },
  { codigo: 341,
    concepto: "Otras retenciones aplicables el 2%" },
  { codigo: 342,
    concepto: "Otras retenciones aplicables el 8%" },
  { codigo: 343,
    concepto: "Otras retenciones aplicables el 25%" },
  { codigo: 344,
    concepto: "Otras retenciones aplicables hasta el 10%" },
  { codigo: 403,
    concepto: "Sin convenio de doble tributación intereses por financiamiento de proveedores externos" },
  { codigo: 405,
    concepto: "Sin convenio de doble tributación intereses de créditos externos" },
  { codigo: 421,
    concepto: "Sin convenio de doble tributación por otros conceptos" },
  { codigo: 427,
    concepto: "Pagos al exterior no sujetos a retención" },
  { codigo: 401,
    concepto: "Con convenio de doble tributación" }
]
