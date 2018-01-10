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

ActiveRecord::Schema.define(version: 20180110060256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "candidates", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "target_role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "competencies", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interview_competencies", force: :cascade do |t|
    t.bigint "interview_id"
    t.bigint "competency_id"
    t.integer "competency_score"
    t.index ["competency_id"], name: "index_interview_competencies_on_competency_id"
    t.index ["interview_id"], name: "index_interview_competencies_on_interview_id"
  end

  create_table "interview_questions", force: :cascade do |t|
    t.bigint "interview_id"
    t.bigint "question_id"
    t.text "candidate_response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interview_id"], name: "index_interview_questions_on_interview_id"
    t.index ["question_id"], name: "index_interview_questions_on_question_id"
  end

  create_table "interviews", force: :cascade do |t|
    t.date "date"
    t.integer "score"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["candidate_id"], name: "index_interviews_on_candidate_id"
    t.index ["user_id"], name: "index_interviews_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question"
    t.bigint "competency_id"
    t.index ["competency_id"], name: "index_questions_on_competency_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "department"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.integer "gender"
    t.integer "race"
    t.integer "education_level"
    t.integer "age"
    t.integer "tenure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "interview_competencies", "competencies"
  add_foreign_key "interview_competencies", "interviews"
  add_foreign_key "interview_questions", "interviews"
  add_foreign_key "interview_questions", "questions"
  add_foreign_key "interviews", "candidates"
  add_foreign_key "interviews", "users"
  add_foreign_key "questions", "competencies"
end
