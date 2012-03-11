class Document < ActiveRecord::Base

  has_many :translated_documents
  has_many :languages, :through => :translated_documents
  has_many :sentences , :through => :translated_documents

  has_many :sequences

  belongs_to :source_language, :class_name => Language
  belongs_to :user

  scope :visible, where(:is_hidden => false)
  scope :basic, select([:title])

  validates_presence_of :title, :source_language_id, :meta, :slug

  validates_uniqueness_of :slug

  attr_accessible :title, :source_language_id, :meta, :language_ids, :as => :uploadable_user

  before_validation :validate_fields

  validates_associated :languages # required if we are assigning languages from document form

  after_create  :populate_data_in_source_language

  attr_accessor :file

  acts_as_votable

  def to_param
    self.slug
  end

  def find_translation(slug = nil)
    l = if slug.nil?
      self.source_language
    else
      Language.find_by_slug(slug)
    end
    self.translated_documents.find_by_language_id(l)
  end

  def translatable_languages
    self.languages - [source_language]
  end

  def source_translation
    find_translation
  end

private

  def populate_data_in_source_language
    td = self.translated_documents.find_by_language_id(source_language)
    td.percent_complete = 100
    td.save
  end

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

