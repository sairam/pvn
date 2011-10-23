class Lang < ActiveRecord::Base
  has_many :user_langs
  has_many :document_langs
end

# create_table "langs", :force => true do |t|
#   t.string "slug", :limit => 2,  :null => false
#   t.string "name", :limit => 50, :null => false
# end
#
# add_index "langs", ["slug"], :name => "index_langs_on_slug", :unique => true