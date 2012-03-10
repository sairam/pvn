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

  attr_accessible :title, :source_language_id, :meta, :language_ids, :as => :uploadable_user

  before_validation :validate_fields

  validates_associated :languages # required if we are assigning languages from document form

  attr_accessor :file

  acts_as_votable

  def to_param
    self.slug
  end

private

  def validate_fields
    # self.languages << self.source_language unless self.languages.include? self.source_language
    self.slug = self.title.parameterize if self.slug.nil?
  end

end
# == Schema Information
# Schema version: 20120310183149
#
# Table name: documents
#
#  id                 :integer         not null, primary key
#  title              :string(255)     not null
#  slug               :string(255)     not null, indexed
#  source_language_id :integer         not null, indexed
#  meta               :text
#  is_hidden          :boolean         default(FALSE), indexed
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

