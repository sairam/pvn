class TranslatedDocument < ActiveRecord::Base
  belongs_to  :document
  belongs_to  :language

  has_many    :sentences
  has_many    :sequences


  def self.sequenced_sentences(id)
    joins(:sequences => :sentence).order("sequences.sequence ASC").select("sentences.data as data")
      .where(:id => id)
      .where("sentences.is_approved = ?",true).pluck(:data)
  end

  def sequenced_sentences
    TranslatedDocument.sequenced_sentences(self.id)
  end

  def summary
    self.sentences.select(:data).where(:is_approved => true)
  end

  def create_document!(data)
    return false unless sequenced_sentences.empty?
    # TODO : do not allow unless this is the source document
    user_id = self.document.user_id
    counter = 1
    data.split(/\r\n/).each do |l|
      next if l.empty?
      sequence = self.sequences.build
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
    self.save!
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

