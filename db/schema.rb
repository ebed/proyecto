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

ActiveRecord::Schema.define(version: 20160825201732) do

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "price",      limit: 24
    t.integer  "product_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "tienda_id"
    t.integer  "stock"
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "ckeditor_assets", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "data_uid",                  null: false
    t.string   "data_name",                 null: false
    t.string   "data_mime_type"
    t.integer  "data_size"
    t.integer  "assetable_id"
    t.string   "assetable_type", limit: 30
    t.string   "type",           limit: 30
    t.integer  "data_width"
    t.integer  "data_height"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "body",       limit: 65535
    t.integer  "user_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "product_id"
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "contactype_id"
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "owner_id"
  end

  create_table "contactypes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "status_id"
    t.string   "location"
    t.string   "haveIt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "main_order_id"
  end

  create_table "historico_compras", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "article_id"
    t.date     "fechaentrega"
    t.integer  "precio"
    t.integer  "qty"
    t.integer  "user_id"
    t.integer  "tienda_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "imagenesarticulos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "filename"
    t.string   "content_type"
    t.binary   "file_contents", limit: 65535
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "order"
    t.integer  "product_id"
    t.string   "image_uid"
    t.string   "image_name"
  end

  create_table "itemsorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "order_id"
    t.integer  "article_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "main_orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "statusorder_id"
  end

  create_table "marcas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "total"
    t.date     "fechacambio"
    t.integer  "statusorder_id"
    t.integer  "user_id"
    t.integer  "tienda_id"
    t.integer  "main_order_id"
    t.integer  "qty"
  end

  create_table "paymentmethods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "paymentmethod_id"
  end

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "marca_id"
    t.text     "specifications", limit: 65535
    t.integer  "year"
    t.integer  "subcategory_id"
  end

  create_table "profiles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "canadmin"
    t.boolean  "cansell"
    t.boolean  "canadminstore"
    t.boolean  "canbuy"
  end

  create_table "scores", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "value"
    t.integer  "user_id"
    t.integer  "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selectedarticles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "article_id"
    t.integer  "qty"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
    t.boolean  "inorder"
  end

  create_table "sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "sells", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "evaluation"
    t.text     "comment",      limit: 65535
    t.integer  "payment_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "order_id"
    t.integer  "precio_venta"
    t.integer  "cantidad"
  end

  create_table "statusorders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "value"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "predecesor_id"
    t.boolean  "pending"
  end

  create_table "subcategories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tiendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.date     "dob"
    t.integer  "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
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
    t.integer  "profile_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
