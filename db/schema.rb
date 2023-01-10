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

ActiveRecord::Schema[7.0].define(version: 2023_01_10_224038) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "description"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "commentable_kinmd"
    t.text "text"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.bigint "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["region_id"], name: "index_countries_on_region_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.bigint "location_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["location_id"], name: "index_departments_on_location_id"
  end

  create_table "dependents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "relationship"
    t.bigint "employee_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["employee_id"], name: "index_dependents_on_employee_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone_number"
    t.date "hire_date"
    t.bigint "job_id", null: false
    t.integer "salary"
    t.bigint "department_id", null: false
    t.integer "manager_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["job_id"], name: "index_employees_on_job_id"
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.integer "min_salary"
    t.integer "max_salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_address"
    t.string "postal_code"
    t.string "city"
    t.string "state_province"
    t.bigint "country_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["country_id"], name: "index_locations_on_country_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.integer "age"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "countries", "regions"
  add_foreign_key "departments", "locations"
  add_foreign_key "dependents", "employees"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "jobs"
  add_foreign_key "locations", "countries"
end
