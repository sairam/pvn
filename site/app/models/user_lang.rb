class UserLang < ActiveRecord::Base
  belongs_to :user
  belongs_to :lang
end


# create_table "user_langs", :force => true do |t|
#   t.integer "user_id", :null => false
#   t.integer "lang_id", :null => false
# end
# 
# add_index "user_langs", ["lang_id"], :name => "index_user_langs_on_lang_id"
# add_index "user_langs", ["user_id", "lang_id"], :name => "index_user_langs_on_user_id_and_lang_id", :unique => true
# add_index "user_langs", ["user_id"], :name => "index_user_langs_on_user_id"