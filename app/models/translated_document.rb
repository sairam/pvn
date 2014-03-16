class TranslatedDocument < ActiveRecord::Base
  belongs_to  :document
  belongs_to  :language

  has_many    :sequences, :through => :document

  has_many    :sentences#, :through => :sequences

  def sequenced_sentences
    self.sentences.joins(:sequence).where("sentences.is_approved = ?",true).order("sequences.sequence ASC").pluck(:data)
  end

  def summary
    self.sentences.joins(:sequence).order("sequences.sequence ASC").pluck(:data)
  end

  def create_document!(data)
    return false unless sequenced_sentences.empty?
    # TODO : do not allow unless this is the source document
    user_id = self.document.user_id
    counter = 1
    data.split(/\r\n/).each do |l|
      next if l.empty?
      sequence = self.document.sequences.build
      sequence.document_id = self.document_id
      sentence = sequence.build_sentence
      sentence.user_id = user_id
      sentence.translated_document_id = self.id
      sequence.sequence = counter
      sentence.data = l
      sentence.is_approved = true
      counter += 1
    end
    self.percent_complete = 100
    self.is_complete = true
    self.document.save!
  end

private

end
# == Schema Information
# Schema version: 20120311090412
#
# Table name: translated_documents
#
#  id               :integer         not null, primary key
#  document_id      :integer         not null, indexed, indexed => [language_id]
#  language_id      :integer         not null, indexed, indexed => [document_id]
#  percent_complete :integer         default(0), not null
#  is_complete      :boolean         default(FALSE), not null, indexed
#
# Indexes
#
#  index_document_langs_on_lang_id                  (language_id)
#  index_document_langs_on_completed                (is_complete)
#  index_document_langs_on_document_id              (document_id)
#  index_document_langs_on_document_id_and_lang_id  (document_id,language_id) UNIQUE
#

