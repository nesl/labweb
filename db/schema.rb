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

ActiveRecord::Schema.define(version: 20160518004851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "carousel_items", force: :cascade do |t|
    t.string   "itemtype"
    t.string   "caption"
    t.string   "sourceurl"
    t.text     "description"
    t.string   "gotourl"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "localphoto"
  end

  create_table "course_offerings", force: :cascade do |t|
    t.integer  "year",       limit: 2, null: false
    t.string   "quarter"
    t.string   "url"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "course_offerings", ["course_id"], name: "index_course_offerings_on_course_id", using: :btree

  create_table "courses", force: :cascade do |t|
    t.string   "department",    null: false
    t.string   "number",        null: false
    t.string   "title",         null: false
    t.text     "description"
    t.string   "url"
    t.string   "crosslistings"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "priority",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_person_maps", force: :cascade do |t|
    t.integer  "document_id",             null: false
    t.integer  "person_id",               null: false
    t.integer  "rank",        default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "document_person_maps", ["document_id"], name: "index_document_person_maps_on_document_id", using: :btree
  add_index "document_person_maps", ["person_id"], name: "index_document_person_maps_on_person_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.integer  "tryear",                limit: 2,                  null: false
    t.integer  "trmonth",               limit: 2,                  null: false
    t.integer  "trnumber",              limit: 2,                  null: false
    t.string   "title",                                            null: false
    t.text     "abstract"
    t.string   "filename"
    t.binary   "file"
    t.string   "urlpdfpaper"
    t.string   "urlsrcpaper"
    t.string   "urlpdfpresentation"
    t.string   "urlsrcpresentation"
    t.string   "urlavmedia"
    t.string   "urldoi"
    t.string   "urlpublisher"
    t.string   "urlgooglescholar"
    t.string   "urlciteseer"
    t.string   "pubin"
    t.string   "pubvol",                limit: 8
    t.string   "pubnum",                limit: 8
    t.string   "pubnum_end",            limit: 8
    t.string   "pubpagefirst",          limit: 8
    t.string   "pubpagelast",           limit: 8
    t.string   "pubpagecount",          limit: 8
    t.date     "pubdate"
    t.date     "pubdate_end"
    t.string   "pubplace",              limit: 32
    t.string   "publisher",             limit: 64
    t.boolean  "ispublic",                         default: false, null: false
    t.boolean  "islabdocument",                    default: true,  null: false
    t.hstore   "miscattributes"
    t.integer  "document_category_id"
    t.integer  "main_research_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["document_category_id"], name: "index_documents_on_document_category_id", using: :btree
  add_index "documents", ["main_research_area_id"], name: "index_documents_on_main_research_area_id", using: :btree

  create_table "documents_grants", id: false, force: :cascade do |t|
    t.integer "document_id"
    t.integer "grant_id"
  end

  create_table "documents_projects", id: false, force: :cascade do |t|
    t.integer "document_id"
    t.integer "project_id"
  end

  create_table "documents_research_areas", id: false, force: :cascade do |t|
    t.integer "document_id"
    t.integer "research_area_id"
  end

  create_table "grants", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "title",                                null: false
    t.text     "description"
    t.boolean  "isactive",              default: true, null: false
    t.string   "url"
    t.date     "startdate"
    t.date     "enddate"
    t.integer  "totalawardamount"
    t.string   "fundingagencyname"
    t.string   "awardnumber"
    t.string   "fundingagencyurl"
    t.string   "fundingagencylogourl"
    t.string   "fundingagencygranturl"
    t.string   "programname"
    t.string   "programurl"
    t.hstore   "miscattributes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grants_people", id: false, force: :cascade do |t|
    t.integer "grant_id"
    t.integer "person_id"
  end

  create_table "grants_products", id: false, force: :cascade do |t|
    t.integer "grant_id"
    t.integer "product_id"
  end

  create_table "grants_projects", id: false, force: :cascade do |t|
    t.integer "grant_id"
    t.integer "project_id"
  end

  create_table "grants_research_areas", id: false, force: :cascade do |t|
    t.integer "grant_id"
    t.integer "research_area_id"
  end

  create_table "news_events", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.date     "date",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: :cascade do |t|
    t.string   "lastname",               limit: 32,                null: false
    t.string   "firstname",              limit: 32,                null: false
    t.string   "middleinitial",          limit: 1
    t.string   "webname",                limit: 32
    t.string   "email"
    t.string   "url"
    t.string   "urlphoto"
    t.string   "phonework",              limit: 32
    t.string   "phonehome",              limit: 32
    t.string   "phonecell",              limit: 32
    t.string   "fax",                    limit: 32
    t.string   "addressoffice"
    t.string   "addresslab"
    t.string   "addressmail"
    t.string   "department"
    t.string   "urldepartment"
    t.string   "organization"
    t.string   "urlorganization"
    t.text     "biography"
    t.text     "researchinterests"
    t.text     "education"
    t.text     "professionalexperience"
    t.text     "professionalservice"
    t.text     "otherpublications"
    t.text     "patents"
    t.text     "awards"
    t.text     "skills"
    t.text     "interests"
    t.text     "secretary"
    t.integer  "bs_year",                limit: 2
    t.string   "bs_title"
    t.string   "bs_school"
    t.string   "bs_field"
    t.boolean  "bs_in_lab"
    t.integer  "ms_year",                limit: 2
    t.string   "ms_title"
    t.string   "ms_school"
    t.string   "ms_field"
    t.string   "ms_thesis"
    t.boolean  "ms_in_lab"
    t.integer  "phd_year",               limit: 2
    t.string   "phd_title"
    t.string   "phd_school"
    t.string   "phd_field"
    t.string   "phd_thesis"
    t.boolean  "phd_in_lab"
    t.hstore   "miscattributes"
    t.integer  "person_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "localphoto"
    t.boolean  "useurlphoto",                       default: true, null: false
  end

  add_index "people", ["person_category_id"], name: "index_people_on_person_category_id", using: :btree

  create_table "people_projects", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "project_id"
  end

  create_table "people_research_areas", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "research_area_id"
  end

  create_table "person_categories", force: :cascade do |t|
    t.string   "name",                  null: false
    t.integer  "relationship_distance", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_categories", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "priority",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_person_maps", force: :cascade do |t|
    t.integer  "product_id", null: false
    t.integer  "person_id",  null: false
    t.integer  "rank",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_person_maps", ["person_id"], name: "index_product_person_maps_on_person_id", using: :btree
  add_index "product_person_maps", ["product_id"], name: "index_product_person_maps_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",                                           null: false
    t.text     "description"
    t.integer  "year",                  limit: 2
    t.integer  "month",                 limit: 2
    t.string   "url"
    t.boolean  "ispublic",                        default: false, null: false
    t.boolean  "islabproduct",                    default: true,  null: false
    t.hstore   "miscattributes"
    t.integer  "product_category_id"
    t.integer  "main_research_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["main_research_area_id"], name: "index_products_on_main_research_area_id", using: :btree
  add_index "products", ["product_category_id"], name: "index_products_on_product_category_id", using: :btree

  create_table "products_projects", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "project_id"
  end

  create_table "products_research_areas", id: false, force: :cascade do |t|
    t.integer "product_id"
    t.integer "research_area_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name",                                 null: false
    t.string   "title",                                null: false
    t.text     "description"
    t.boolean  "isactive",              default: true, null: false
    t.string   "url"
    t.hstore   "miscattributes"
    t.integer  "main_research_area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["main_research_area_id"], name: "index_projects_on_main_research_area_id", using: :btree

  create_table "projects_research_areas", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "research_area_id"
  end

  create_table "research_areas", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "web_pages", force: :cascade do |t|
    t.string   "pagetitle",                  null: false
    t.string   "bartitle"
    t.text     "body"
    t.boolean  "ispublic",   default: false, null: false
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
