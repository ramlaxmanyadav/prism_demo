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

ActiveRecord::Schema[8.1].define(version: 2026_07_12_162721) do
  create_table "active_admin_comments", force: :cascade do |t|
    t.integer "author_id"
    t.string "author_type"
    t.text "body"
    t.datetime "created_at", null: false
    t.string "namespace"
    t.integer "resource_id"
    t.string "resource_type"
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "author"
    t.boolean "available"
    t.integer "copies_count"
    t.datetime "created_at", null: false
    t.string "isbn"
    t.date "published_on"
    t.integer "subject_id"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["subject_id"], name: "index_books_on_subject_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "department"
    t.string "designation"
    t.string "email"
    t.string "first_name"
    t.date "hire_date"
    t.string "last_name"
    t.string "phone"
    t.decimal "salary"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

  create_table "student_subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "student_id", null: false
    t.integer "subject_id", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id", "subject_id"], name: "index_student_subjects_on_student_id_and_subject_id", unique: true
    t.index ["student_id"], name: "index_student_subjects_on_student_id"
    t.index ["subject_id"], name: "index_student_subjects_on_subject_id"
  end

  create_table "students", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "email"
    t.string "enrollment_number"
    t.string "first_name"
    t.string "grade"
    t.string "last_name"
    t.string "phone"
    t.integer "teacher_id"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["enrollment_number"], name: "index_students_on_enrollment_number", unique: true
    t.index ["teacher_id"], name: "index_students_on_teacher_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "code"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_subjects_on_code", unique: true
  end

  create_table "teachers", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "email"
    t.string "first_name"
    t.date "hire_date"
    t.string "last_name"
    t.string "phone"
    t.decimal "salary"
    t.integer "subject_id"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["subject_id"], name: "index_teachers_on_subject_id"
  end

  add_foreign_key "books", "subjects"
  add_foreign_key "student_subjects", "students"
  add_foreign_key "student_subjects", "subjects"
  add_foreign_key "students", "teachers"
  add_foreign_key "teachers", "subjects"
end
