class DocumentLang < ActiveRecord::Base
  belongs_to :document
  belongs_to :lang
  has_many :sentences
  has_many :sequences
end

# create_table "document_langs", :force => true do |t|
#   t.integer "document_id",      :null => false
#   t.integer "lang_id",          :null => false
#   t.integer "percent_complete", :null => false
#   t.boolean "completed",        :null => false
# end
# 
# add_index "document_langs", ["completed"], :name => "index_document_langs_on_completed"
# add_index "document_langs", ["document_id", "lang_id"], :name => "index_document_langs_on_document_id_and_lang_id", :unique => true
# add_index "document_langs", ["document_id"], :name => "index_document_langs_on_document_id"
# add_index "document_langs", ["lang_id"], :name => "index_document_langs_on_lang_id"