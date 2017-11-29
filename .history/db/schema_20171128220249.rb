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

ActiveRecord::Schema.define(version: 20171127201936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acomments", force: :cascade do |t|
    t.string "texto"
    t.bigint "user_id"
    t.bigint "question_id"
    t.bigint "answer_id"
    t.integer "positive_votes", default: 0
    t.integer "negative_votes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_acomments_on_answer_id"
    t.index ["question_id"], name: "index_acomments_on_question_id"
    t.index ["user_id"], name: "index_acomments_on_user_id"
  end

  create_table "answers", force: :cascade do |t|
    t.string "respuesta"
    t.integer "question_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "positive_votes", default: 0
    t.integer "negative_votes", default: 0
  end

  create_table "avotes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "answer_id"
    t.boolean "positivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_avotes_on_answer_id"
    t.index ["user_id"], name: "index_avotes_on_user_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "universidad"
    t.string "facultad"
    t.string "provincia"
    t.string "ciudad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "qcomments", force: :cascade do |t|
    t.string "texto"
    t.bigint "user_id"
    t.bigint "question_id"
    t.integer "positive_votes", default: 0
    t.integer "negative_votes", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_qcomments_on_question_id"
    t.index ["user_id"], name: "index_qcomments_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "pregunta"
    t.string "detalles"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "faculty_id"
    t.integer "visitas", default: 0
    t.integer "cant_respuestas", default: 0
    t.integer "positive_votes", default: 0
    t.integer "negative_votes", default: 0
  end

  create_table "qvotes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "question_id"
    t.boolean "positivo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_qvotes_on_question_id"
    t.index ["user_id"], name: "index_qvotes_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_taggings_on_question_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nombre"
    t.string "apellido"
    t.string "sexo"
    t.date "fechaNacimiento"
    t.integer "faculty_id"
    t.integer "puntos", default: 1
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

<<<<<<< HEAD
  add_foreign_key "taggings", "questions"
  add_foreign_key "taggings", "tags"
=======
  add_foreign_key "acomments", "answers"
  add_foreign_key "acomments", "questions"
  add_foreign_key "acomments", "users"
  add_foreign_key "avotes", "answers"
  add_foreign_key "avotes", "users"
  add_foreign_key "qcomments", "questions"
  add_foreign_key "qcomments", "users"
  add_foreign_key "qvotes", "questions"
  add_foreign_key "qvotes", "users"
>>>>>>> 0016cb02e73234e935a84971f67d35bee8b32daf
end
