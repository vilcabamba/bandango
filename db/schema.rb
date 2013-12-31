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

ActiveRecord::Schema.define(version: 20131231191916) do

  create_table "clientes", force: true do |t|
    t.string   "tipo_id",        default: "Cédula", null: false
    t.string   "identificacion",                    null: false
    t.string   "nombres",                           null: false
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clientes", ["identificacion"], name: "index_clientes_on_identificacion", unique: true, using: :btree

  create_table "comprobantes", force: true do |t|
    t.integer "codigo",              null: false
    t.string  "tipo",                null: false
    t.text    "codigo_secuenciales"
    t.text    "sustento_tributario"
  end

  add_index "comprobantes", ["codigo"], name: "index_comprobantes_on_codigo", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.string   "nombres"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["token"], name: "index_users_on_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "ventas", force: true do |t|
    t.integer  "cliente_id",     null: false
    t.integer  "comprobante_id", null: false
    t.float    "base_no_iva",    null: false
    t.float    "base_iva_zero",  null: false
    t.float    "base_iva",       null: false
    t.float    "monto_iva",      null: false
    t.float    "iva_retenido",   null: false
    t.float    "renta_retenido", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ventas", ["cliente_id"], name: "index_ventas_on_cliente_id", using: :btree
  add_index "ventas", ["comprobante_id"], name: "index_ventas_on_comprobante_id", using: :btree

end
