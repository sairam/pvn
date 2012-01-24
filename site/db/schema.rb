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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120124141604) do

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.text     "body",             :default => ""
    t.integer  "user_id",          :default => 0,  :null => false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "documents", :force => true do |t|
    t.string   "title",              :null => false
    t.string   "slug",               :null => false
    t.integer  "source_language_id", :null => false
    t.text     "meta"
    t.boolean  "is_hidden"
    t.integer  "user_id",            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "documents", ["is_hidden"], :name => "index_documents_on_hidden"
  add_index "documents", ["slug"], :name => "index_documents_on_slug", :unique => true
  add_index "documents", ["source_language_id"], :name => "index_documents_on_lang_id"
  add_index "documents", ["user_id"], :name => "index_documents_on_user_id"

  create_table "languages", :force => true do |t|
    t.string "slug", :limit => 2,  :null => false
    t.string "name", :limit => 50, :null => false
  end

  add_index "languages", ["slug"], :name => "index_langs_on_slug", :unique => true

  create_table "languages_users", :force => true do |t|
    t.integer "user_id",     :null => false
    t.integer "language_id", :null => false
  end

  add_index "languages_users", ["language_id"], :name => "index_user_langs_on_lang_id"
  add_index "languages_users", ["user_id", "language_id"], :name => "index_user_langs_on_user_id_and_lang_id", :unique => true
  add_index "languages_users", ["user_id"], :name => "index_user_langs_on_user_id"

  create_table "sentences", :force => true do |t|
    t.integer  "user_id",              :null => false
    t.integer  "sentence_id"
    t.integer  "document_language_id", :null => false
    t.text     "data",                 :null => false
    t.boolean  "is_approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sentences", ["document_language_id", "is_approved"], :name => "index_lines_on_document_lang_id_and_approved"
  add_index "sentences", ["document_language_id"], :name => "index_lines_on_document_lang_id"
  add_index "sentences", ["is_approved"], :name => "index_lines_on_approved"
  add_index "sentences", ["sentence_id"], :name => "index_sentences_on_sentence_id"
  add_index "sentences", ["user_id"], :name => "index_lines_on_user_id"

  create_table "sequences", :force => true do |t|
    t.integer  "document_language_id", :null => false
    t.float    "sequence",             :null => false
    t.integer  "sentence_id",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sequences", ["document_language_id"], :name => "index_sequences_on_document_lang_id"
  add_index "sequences", ["sentence_id"], :name => "index_sequences_on_sentence_id"

  create_table "translated_documents", :force => true do |t|
    t.integer "document_id",      :null => false
    t.integer "language_id",      :null => false
    t.integer "percent_complete", :null => false
    t.boolean "is_complete",      :null => false
  end

  add_index "translated_documents", ["document_id", "language_id"], :name => "index_document_langs_on_document_id_and_lang_id", :unique => true
  add_index "translated_documents", ["document_id"], :name => "index_document_langs_on_document_id"
  add_index "translated_documents", ["is_complete"], :name => "index_document_langs_on_completed"
  add_index "translated_documents", ["language_id"], :name => "index_document_langs_on_lang_id"

  create_table "users", :force => true do |t|
    t.string   "name",                   :limit => 100
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type"], :name => "index_votes_on_votable_id_and_votable_type"
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
