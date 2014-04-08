# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140408023053) do

  create_table "cash_denomination_items", force: true do |t|
    t.integer  "cash_denomination_id",             null: false
    t.integer  "cierre_caja_id",                   null: false
    t.integer  "cantidad",             default: 0, null: false
    t.datetime "created_at"
  end

  add_index "cash_denomination_items", ["cash_denomination_id", "cierre_caja_id"], name: "cash_denomination_items", using: :btree

  create_table "cash_denominations", force: true do |t|
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string  "kind",                           null: false
  end

  add_index "cash_denominations", ["price", "kind"], name: "index_cash_denominations_on_price_and_kind", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["nombre"], name: "index_categories_on_nombre", using: :btree

  create_table "cierre_caja_orders", force: true do |t|
    t.integer  "cierre_caja_id", null: false
    t.integer  "order_id",       null: false
    t.string   "order_type",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cierre_caja_orders", ["cierre_caja_id", "order_id", "order_type"], name: "cierre_cajas_orders", using: :btree
  add_index "cierre_caja_orders", ["order_id", "order_type"], name: "cierre_caja_orderable", using: :btree

  create_table "cierres_caja", force: true do |t|
    t.integer  "user_id",                            null: false
    t.text     "totales"
    t.integer  "fondo_anterior_cents",   default: 0, null: false
    t.integer  "efectivo_compras_cents", default: 0, null: false
    t.integer  "iva_compras_cents",      default: 0, null: false
    t.integer  "ice_compras_cents",      default: 0, null: false
    t.integer  "efectivo_ventas_cents",  default: 0, null: false
    t.integer  "iva_ventas_cents",       default: 0, null: false
    t.integer  "ice_ventas_cents",       default: 0, null: false
    t.integer  "efectivo_teorico_cents", default: 0, null: false
    t.integer  "efectivo_real_cents",    default: 0, null: false
    t.integer  "retiro_cents",           default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cierres_caja", ["user_id"], name: "index_cierres_caja_on_user_id", using: :btree

  create_table "clientes", force: true do |t|
    t.string   "tipo_id",        default: "Cédula", null: false
    t.string   "identificacion",                    null: false
    t.string   "nombres"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clientes", ["identificacion"], name: "index_clientes_on_identificacion", unique: true, using: :btree

  create_table "compras", force: true do |t|
    t.integer  "sustento_comprobante_id",                                                  null: false
    t.integer  "cliente_id",                                                               null: false
    t.integer  "comprobante_id",                                                           null: false
    t.date     "fecha_registro",                                                           null: false
    t.string   "numero_serie_establecimiento",                                             null: false
    t.string   "numero_serie_punto_emision",                                               null: false
    t.string   "numero_serie_comprobante",                                                 null: false
    t.date     "fecha_emision",                                                            null: false
    t.string   "autorizacion_comprobante",                                                 null: false
    t.float    "retencion_iva_bienes",                                default: 0.0,        null: false
    t.float    "retencion_iva_servicios",                             default: 0.0,        null: false
    t.float    "retencion_iva_cien",                                  default: 0.0,        null: false
    t.integer  "concepto_retencion_fuente_id"
    t.float    "base_imponible_renta"
    t.integer  "porcentaje_retencion_fuente"
    t.string   "numero_serie_retencion_establecimiento"
    t.string   "numero_serie_retencion_punto_emision"
    t.string   "numero_serie_retencion"
    t.integer  "numero_autorizacion_retencion"
    t.date     "fecha_emision_retencion"
    t.integer  "comprobante_modificado_id"
    t.string   "numero_serie_comprobante_modificado_establecimiento"
    t.string   "numero_serie_comprobante_modificado_punto_emision"
    t.string   "numero_serie_comprobante_modificado"
    t.string   "numero_autorizacion_comprobante_modificado"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "forma_de_pago",                                       default: "Efectivo", null: false
  end

  add_index "compras", ["cliente_id"], name: "index_compras_on_cliente_id", using: :btree
  add_index "compras", ["comprobante_id"], name: "index_compras_on_comprobante_id", using: :btree
  add_index "compras", ["concepto_retencion_fuente_id"], name: "index_compras_on_concepto_retencion_fuente_id", using: :btree
  add_index "compras", ["fecha_emision"], name: "index_compras_on_fecha_emision", using: :btree
  add_index "compras", ["forma_de_pago"], name: "index_compras_on_forma_de_pago", using: :btree
  add_index "compras", ["sustento_comprobante_id"], name: "index_compras_on_sustento_comprobante_id", using: :btree

  create_table "comprobantes", force: true do |t|
    t.integer "codigo",              null: false
    t.string  "tipo",                null: false
    t.text    "codigo_secuenciales"
    t.text    "sustento_tributario"
  end

  add_index "comprobantes", ["codigo"], name: "index_comprobantes_on_codigo", unique: true, using: :btree

  create_table "conceptos_retencion_fuente", force: true do |t|
    t.string   "codigo",     null: false
    t.string   "concepto",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "porcentaje"
  end

  add_index "conceptos_retencion_fuente", ["codigo"], name: "index_conceptos_retencion_fuente_on_codigo", unique: true, using: :btree

  create_table "emisores", force: true do |t|
    t.string   "ruc",                                      null: false
    t.string   "razon_social",                             null: false
    t.string   "nombre_comercial"
    t.string   "direccion_matriz",                         null: false
    t.string   "direccion_establecimiento",                null: false
    t.string   "codigo_establecimiento",                   null: false
    t.string   "codigo_punto_emision",                     null: false
    t.string   "contribuyente_especial_numero_resolucion"
    t.boolean  "obligado_llevar_contabilidad"
    t.string   "imagen"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "autorizacion_comprobantes"
  end

  add_index "emisores", ["ruc"], name: "index_emisores_on_ruc", unique: true, using: :btree

  create_table "items", force: true do |t|
    t.integer  "category_id", default: 1,  null: false
    t.string   "nombre",                   null: false
    t.string   "descripcion"
    t.float    "base_venta"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "iva"
    t.integer  "iva_tarifa",  default: 12
    t.boolean  "ice"
    t.integer  "ice_tarifa",  default: 15
    t.boolean  "se_vende"
    t.boolean  "se_compra"
    t.float    "base_compra"
  end

  add_index "items", ["nombre"], name: "index_items_on_nombre", using: :btree
  add_index "items", ["se_compra"], name: "index_items_on_se_compra", using: :btree
  add_index "items", ["se_vende"], name: "index_items_on_se_vende", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "item_id",                null: false
    t.integer  "order_id",               null: false
    t.integer  "cantidad",               null: false
    t.float    "cached_item_precio",     null: false
    t.string   "cached_item_nombre",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "order_type",             null: false
    t.boolean  "cached_item_iva"
    t.boolean  "cached_item_ice"
    t.integer  "cached_item_iva_tarifa"
    t.integer  "cached_item_ice_tarifa"
  end

  add_index "order_items", ["item_id"], name: "index_order_items_on_item_id", using: :btree
  add_index "order_items", ["order_id", "order_type"], name: "index_order_items_on_order_id_and_order_type", using: :btree
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "retenciones", force: true do |t|
    t.integer  "order_id",                     null: false
    t.integer  "concepto_retencion_fuente_id"
    t.date     "fecha_emision",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numero_autorizacion"
    t.string   "numero_serie_establecimiento"
    t.string   "numero_serie_punto_emision"
    t.string   "numero_serie_secuencial"
    t.string   "order_type",                   null: false
  end

  add_index "retenciones", ["concepto_retencion_fuente_id"], name: "index_retenciones_on_concepto_retencion_fuente_id", using: :btree
  add_index "retenciones", ["order_id", "order_type"], name: "index_retenciones_on_order_id_and_order_type", using: :btree
  add_index "retenciones", ["order_id"], name: "index_retenciones_on_order_id", using: :btree

  create_table "sani_requests", force: true do |t|
    t.integer "last_id", default: 0, null: false
  end

  create_table "sustento_comprobantes", force: true do |t|
    t.integer  "codigo",                   null: false
    t.string   "tipo",                     null: false
    t.text     "codigo_tipo_comprobantes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sustento_comprobantes", ["codigo"], name: "index_sustento_comprobantes_on_codigo", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",                        null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "nombres"
    t.boolean  "active",           default: true
  end

  add_index "users", ["active"], name: "index_users_on_active", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "ventas", force: true do |t|
    t.integer  "cliente_id",                                        null: false
    t.integer  "comprobante_id",                                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "numero_serie_establecimiento"
    t.string   "numero_serie_punto_emision"
    t.string   "numero_serie_comprobante"
    t.date     "fecha_emision"
    t.date     "fecha_registro"
    t.string   "autorizacion_comprobante"
    t.string   "forma_de_pago",                default: "Efectivo", null: false
  end

  add_index "ventas", ["cliente_id"], name: "index_ventas_on_cliente_id", using: :btree
  add_index "ventas", ["comprobante_id"], name: "index_ventas_on_comprobante_id", using: :btree
  add_index "ventas", ["fecha_emision"], name: "index_ventas_on_fecha_emision", using: :btree
  add_index "ventas", ["forma_de_pago"], name: "index_ventas_on_forma_de_pago", using: :btree

end
