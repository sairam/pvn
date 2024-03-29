class Language < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :translated_documents
  has_many :documents, :through => :translated_documents, :foreign_key => :source_language_id
  has_many :sentences, :through => :translated_documents

  def to_param
    self.slug
  end

end
# == Schema Information
# Schema version: 20120124141604
#
# Table name: languages
#
#  id   :integer         not null, primary key
#  slug :string(2)       not null, indexed
#  name :string(50)      not null
#
# Indexes
#
#  index_langs_on_slug  (slug) UNIQUE
#

