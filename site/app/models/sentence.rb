class Sentence < ActiveRecord::Base
  belongs_to :user
  belongs_to :translated_document

  has_one :sequence

  # OPTIMIZE: self reference to sentence_id
  belongs_to :sentence
  has_many :sentences

end

# create_table "sentences", :force => true do |t|
#   t.integer  "user_id",              :null => false
#   t.integer  "sentence_id"
#   t.integer  "document_language_id", :null => false
#   t.text     "data",                 :null => false
#   t.boolean  "is_approved"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "sentences", ["document_language_id", "is_approved"], :name => "index_lines_on_document_lang_id_and_approved"
# add_index "sentences", ["document_language_id"], :name => "index_lines_on_document_lang_id"
# add_index "sentences", ["is_approved"], :name => "index_lines_on_approved"
# add_index "sentences", ["sentence_id"], :name => "index_sentences_on_sentence_id"
# add_index "sentences", ["user_id"], :name => "index_lines_on_user_id"
