class Sequence < ActiveRecord::Base
  belongs_to :document_lang
  belongs_to :sentence
end

# create_table "sequences", :force => true do |t|
#   t.integer  "document_lang_id", :null => false
#   t.float    "sequence",         :null => false
#   t.integer  "line_id",          :null => false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
# 
# add_index "sequences", ["document_lang_id"], :name => "index_sequences_on_document_lang_id"
# add_index "sequences", ["line_id"], :name => "index_sequences_on_line_id"