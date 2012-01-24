class Document < ActiveRecord::Base

  has_many :translated_documents
  has_many :languages, :through => :translated_documents
  has_many :sentences , :through => :translated_documents
  belongs_to :user

  scope :visible, where(:hidden => false)
  scope :basic, select([:title])


  acts_as_votable

  def to_param
    self.slug
  end

end

# create_table "documents", :force => true do |t|
#   t.string   "title",              :null => false
#   t.string   "slug",               :null => false
#   t.integer  "source_language_id", :null => false
#   t.text     "meta"
#   t.boolean  "is_hidden"
#   t.integer  "user_id",            :null => false
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "documents", ["is_hidden"], :name => "index_documents_on_hidden"
# add_index "documents", ["slug"], :name => "index_documents_on_slug", :unique => true
# add_index "documents", ["source_language_id"], :name => "index_documents_on_lang_id"
# add_index "documents", ["user_id"], :name => "index_documents_on_user_id"
