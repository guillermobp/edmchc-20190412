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

ActiveRecord::Schema.define(version: 2019_01_20_230644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "charlas", force: :cascade do |t|
    t.date "fecha"
    t.string "titulo"
    t.string "expositor"
    t.string "lugar"
    t.time "hora_inicio"
    t.time "hora_termino"
    t.bigint "encuentro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encuentro_id"], name: "index_charlas_on_encuentro_id"
  end

  create_table "conciertos", force: :cascade do |t|
    t.date "fecha"
    t.time "hora"
    t.text "lugar"
    t.text "obras"
    t.text "interpretes"
    t.bigint "encuentro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "videos"
    t.string "compositor"
    t.string "titulo"
    t.string "video_url"
    t.index ["encuentro_id"], name: "index_conciertos_on_encuentro_id"
  end

  create_table "encuentros", force: :cascade do |t|
    t.integer "version"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "epigrafe"
    t.string "titulo"
    t.string "bajada"
    t.string "titulo_quienes_somos"
    t.text "cuerpo_quienes_somos"
    t.string "nombre_coordinador"
    t.text "bio_coordinador"
    t.text "videos"
  end

  create_table "ensayos", force: :cascade do |t|
    t.string "titulo"
    t.text "descripcion"
    t.bigint "encuentro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encuentro_id"], name: "index_ensayos_on_encuentro_id"
  end

  create_table "exponentes", force: :cascade do |t|
    t.bigint "encuentro_id"
    t.string "nombre"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["encuentro_id"], name: "index_exponentes_on_encuentro_id"
  end

  add_foreign_key "charlas", "encuentros"
  add_foreign_key "conciertos", "encuentros"
  add_foreign_key "ensayos", "encuentros"
end
