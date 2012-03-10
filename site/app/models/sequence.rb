class Sequence < ActiveRecord::Base
  belongs_to :translated_document
  belongs_to :sentence
end

# create_table "sequences", :force => true do |t|
#   t.integer  "document_language_id", :null => false
#   t.float    "sequence",             :null => false
#   t.integer  "sentence_id",          :null => false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "sequences", ["document_language_id"], :name => "index_sequences_on_document_lang_id"
# add_index "sequences", ["sentence_id"], :name => "index_sequences_on_sentence_id"
# == Schema Information
# Schema version: 20120124141604
#
# Table name: sequences
#
#  id                   :integer         not null, primary key
#  document_language_id :integer         not null, indexed
#  sequence             :float           not null
#  sentence_id          :integer         not null, indexed
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_sequences_on_sentence_id       (sentence_id)
#  index_sequences_on_document_lang_id  (document_language_id)
#

