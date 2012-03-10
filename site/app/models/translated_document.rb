class TranslatedDocument < ActiveRecord::Base
  belongs_to :document
  belongs_to :language
  has_many :sentences
  has_many :sequences

  def summary
    self.sentences.select(:data).where(:is_approved => true)
  end

private

end
# == Schema Information
# Schema version: 20120310183149
#
# Table name: translated_documents
#
#  id               :integer         not null, primary key
#  document_id      :integer         not null, indexed => [language_id], indexed
#  language_id      :integer         not null, indexed => [document_id], indexed
#  percent_complete :integer         default(0), not null
#  is_complete      :boolean         default(FALSE), not null, indexed
#
# Indexes
#
#  index_document_langs_on_completed                (is_complete)
#  index_document_langs_on_document_id_and_lang_id  (document_id,language_id) UNIQUE
#  index_document_langs_on_lang_id                  (language_id)
#  index_document_langs_on_document_id              (document_id)
#

