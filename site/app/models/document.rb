class Document < ActiveRecord::Base

  has_many :document_langs
  has_many :sentences , :through => :document_langs
  belongs_to :user

  scope :visible, where(:hidden => false)
  scope :basic, select([:title])


  acts_as_votable

  def to_param
    self.slug
  end

end
# Schema
# create_table "documents", :force => true do |t|
#   t.string   "title",      :null => false
#   t.string   "slug",       :null => false
#   t.integer  "lang_id",    :null => false
#   t.text     "meta"
#   t.string   "source"
#   t.boolean  "hidden"
#   t.integer  "user_id",    :null => false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "documents", ["hidden"], :name => "index_documents_on_hidden"
# add_index "documents", ["lang_id"], :name => "index_documents_on_lang_id"
# add_index "documents", ["slug"], :name => "index_documents_on_slug", :unique => true
# add_index "documents", ["user_id"], :name => "index_documents_on_user_id"
