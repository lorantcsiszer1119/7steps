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

ActiveRecord::Schema.define(version: 20140106174635) do

  create_table "delayed_jobs", force: true do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "openings", force: true do |t|
    t.integer  "user_id"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "step_one_finished",          default: false
    t.boolean  "step_two_finished",          default: false
    t.boolean  "two_reqs_example",           default: false
    t.boolean  "two_reqs_number",            default: false
    t.boolean  "two_reqs_completed",         default: false
    t.string   "title"
    t.string   "company"
    t.boolean  "step_three_finished",        default: false
    t.boolean  "three_li_photo",             default: false
    t.boolean  "three_li_headline",          default: false
    t.boolean  "three_li_summary",           default: false
    t.boolean  "three_li_specialties",       default: false
    t.boolean  "three_li_work",              default: false
    t.boolean  "three_li_education",         default: false
    t.boolean  "three_li_skills",            default: false
    t.boolean  "three_li_work_others",       default: false
    t.boolean  "three_li_education_others",  default: false
    t.boolean  "three_li_skills_others",     default: false
    t.boolean  "three_li_connections",       default: false
    t.boolean  "three_li_recommendations",   default: false
    t.boolean  "three_li_others",            default: false
    t.boolean  "three_google",               default: false
    t.boolean  "three_by_links",             default: false
    t.boolean  "three_facebook",             default: false
    t.boolean  "three_twitter",              default: false
    t.boolean  "three_social_media",         default: false
    t.boolean  "step_four_finished",         default: false
    t.string   "four_cv_link"
    t.boolean  "four_cv_format",             default: false
    t.boolean  "four_cv_basic",              default: false
    t.boolean  "four_cv_linkedin",           default: false
    t.boolean  "four_cv_headline",           default: false
    t.boolean  "four_cv_qualifications",     default: false
    t.boolean  "four_cv_work",               default: false
    t.boolean  "four_cv_education",          default: false
    t.boolean  "four_cv_skills",             default: false
    t.boolean  "four_cv_work_others",        default: false
    t.boolean  "four_cv_education_others",   default: false
    t.boolean  "four_cv_skills_others",      default: false
    t.boolean  "step_five_finished",         default: false
    t.string   "five_cl_link"
    t.boolean  "five_cl_recruiter_name",     default: false
    t.boolean  "five_cl_intro",              default: false
    t.boolean  "five_cl_skills",             default: false
    t.boolean  "five_cl_company_positives",  default: false
    t.boolean  "five_cl_availability",       default: false
    t.boolean  "step_six_finished",          default: false
    t.boolean  "six_qa_duration",            default: false
    t.boolean  "six_qa_specific",            default: false
    t.boolean  "six_qa_examples",            default: false
    t.boolean  "six_qa_star_method",         default: false
    t.boolean  "six_qa_answers_reqs",        default: false
    t.boolean  "six_qa_strenght",            default: false
    t.boolean  "six_qa_weakness",            default: false
    t.boolean  "six_qa_salary",              default: false
    t.boolean  "step_seven_finished",        default: false
    t.boolean  "seven_essentials",           default: false
    t.boolean  "seven_cl_and_cv",            default: false
    t.date     "seven_next_step"
    t.string   "seven_q_three"
    t.string   "seven_q_two"
    t.string   "seven_q_one"
    t.string   "seven_recruiter_background"
    t.string   "seven_recruiter_name"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "q_and_a_link"
    t.string   "li_link"
    t.string   "by_link"
    t.string   "qa_link"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
