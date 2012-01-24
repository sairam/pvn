class TranslatedDocument < ActiveRecord::Base
  belongs_to :document
  belongs_to :language
  has_many :sentences
  has_many :sequences
end

# create_table "translated_documents", :force => true do |t|
#   t.integer "document_id",      :null => false
#   t.integer "language_id",      :null => false
#   t.integer "percent_complete", :null => false
#   t.boolean "is_complete",      :null => false
# end
#
# add_index "translated_documents", ["document_id", "language_id"], :name => "index_document_langs_on_document_id_and_lang_id", :unique => true
# add_index "translated_documents", ["document_id"], :name => "index_document_langs_on_document_id"
# add_index "translated_documents", ["is_complete"], :name => "index_document_langs_on_completed"
# add_index "translated_documents", ["language_id"], :name => "index_document_langs_on_lang_id"
