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
# == Schema Information
# Schema version: 20120124141604
#
# Table name: sentences
#
#  id                   :integer         not null, primary key
#  user_id              :integer         not null, indexed
#  sentence_id          :integer         indexed
#  document_language_id :integer         not null, indexed => [is_approved], indexed
#  data                 :text            not null
#  is_approved          :boolean         indexed => [document_language_id], indexed
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_sentences_on_sentence_id                (sentence_id)
#  index_lines_on_document_lang_id_and_approved  (document_language_id,is_approved)
#  index_lines_on_approved                       (is_approved)
#  index_lines_on_document_lang_id               (document_language_id)
#  index_lines_on_user_id                        (user_id)
#

