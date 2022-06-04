# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_03_214139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cuestionarios", force: :cascade do |t|
    t.string "email"
    t.string "nombre"
    t.integer "edad"
    t.string "sexo"
    t.string "escolaridad"
    t.string "pais"
    t.string "ciudad"
    t.string "localidad"
    t.integer "peso"
    t.float "altura"
    t.string "alimentacion_sana"
    t.string "alimentacion_dana_ambiente"
    t.string "persona_actividad"
    t.integer "actividad_fisica"
    t.string "sobrepeso"
    t.string "obesidad"
    t.string "hipertension"
    t.string "colesterol"
    t.string "trigliceridos"
    t.string "diabetes"
    t.string "glucosa"
    t.string "diabetes_familia"
    t.string "diabetes_sintomas"
    t.string "dieta"
    t.string "origen_vegetales"
    t.string "origen_frutas"
    t.string "origen_carne"
    t.string "origen_leche"
    t.string "origen_cereales"
    t.float "frecuencia_res"
    t.float "frecuencia_puerco"
    t.float "frecuencia_borrego"
    t.float "frecuencia_pollo"
    t.float "frecuencia_salmon"
    t.float "frecuencia_atun"
    t.float "frecuencia_leche"
    t.float "frecuencia_queso"
    t.float "frecuencia_yogurt"
    t.float "frecuencia_pescados_mariscos"
    t.string "valores_pescados_mariscos"
    t.float "frecuencia_huevo"
    t.integer "cantidad_huevo"
    t.float "frecuencia_vegetales"
    t.integer "cantidad_vegetales"
    t.float "frecuencia_fruta"
    t.float "cantidad_fruta"
    t.float "frecuencia_arroz"
    t.float "frecuencia_leguminosas"
    t.float "frecuencia_avena"
    t.float "frecuencia_amaranto"
    t.float "frecuencia_tortillas"
    t.integer "cantidad_tortillas"
    t.string "insectos"
    t.float "frecuencia_insectos"
    t.float "frecuencia_tamales"
    t.float "frecuencia_atole"
    t.float "frecuencia_sandwich"
    t.float "frecuencia_tacos"
    t.string "valores_tacos"
    t.float "frecuencia_torta"
    t.float "frecuencia_bolillo"
    t.integer "cantidad_bolillo"
    t.float "frecuencia_sopas"
    t.float "frecuencia_jugos"
    t.float "frecuencia_refrescos"
    t.float "frecuencia_bebidas_energetizantes"
    t.float "frecuencia_galletas"
    t.string "valores_galletas"
    t.float "frecuencia_embutidos"
    t.string "valores_embutidos"
    t.float "frecuencia_pan"
    t.string "valores_pan"
    t.integer "cantidad_pan"
    t.float "frecuencia_frituras"
    t.string "valores_frituras"
    t.float "frecuencia_chocolates"
    t.integer "cantidad_chocolates"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "necesidad_orinar"
    t.boolean "perdida_peso"
    t.boolean "sed_excesiva"
    t.boolean "hambre_excesiva"
    t.boolean "al_pastor"
    t.boolean "suadero"
    t.boolean "guisados"
    t.boolean "galletas_saladas"
    t.boolean "galletas_dulces"
    t.boolean "jamon_pavo"
    t.boolean "jamon_puerco"
    t.boolean "salchicha_pavo"
    t.boolean "fritura_papa"
    t.boolean "fritura_chicharron"
    t.boolean "mantecadas"
    t.boolean "pan_blanco"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
