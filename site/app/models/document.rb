class Document < ActiveRecord::Base

  has_many :translated_documents
  has_many :languages, :through => :translated_documents
  has_many :sentences , :through => :translated_documents

  belongs_to :source_language, :class_name => Language
  belongs_to :user

  scope :visible, where(:is_hidden => false)
  scope :basic, select([:title])

  validates_presence_of :title, :source_language_id, :meta, :slug

  validates_uniqueness_of :slug

  attr_accessible :title, :source_language_id, :meta, :as => :uploadable_user

  before_validation :validate_fields

  attr_accessor :file

  acts_as_votable

  def to_param
    self.slug
  end

private

  def validate_fields
    self.slug = self.title.parameterize
    self.is_hidden = false
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
# == Schema Information
# Schema version: 20120124141604
#
# Table name: documents
#
#  id                 :integer         not null, primary key
#  title              :string(255)     not null
#  slug               :string(255)     not null, indexed
#  source_language_id :integer         not null, indexed
#  meta               :text
#  is_hidden          :boolean         indexed
#  user_id            :integer         not null, indexed
#  created_at         :datetime
#  updated_at         :datetime
#
# Indexes
#
#  index_documents_on_user_id  (user_id)
#  index_documents_on_hidden   (is_hidden)
#  index_documents_on_lang_id  (source_language_id)
#  index_documents_on_slug     (slug) UNIQUE
#

