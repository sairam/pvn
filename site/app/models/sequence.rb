class Sequence < ActiveRecord::Base
  belongs_to  :translated_document
  belongs_to  :sentence

  def document
    translated_document.document
  end

  def document_to_param
    translated_document.document.to_param
  end

  def language
    translated_document.language
  end

  def language_to_param
    translated_document.language.to_param
  end

  def document_language_param
    [document_to_param,language_to_param]
  end

  def document_language_sequence_param
    [document_to_param, language_to_param, to_param]
  end

  def to_param
    self.sequence.to_s.sub('.','-')
  end

  def from_param(param)
    param.sub('-','.').to_f
  end

end
# == Schema Information
# Schema version: 20120310183149
#
# Table name: sequences
#
#  id                     :integer         not null, primary key
#  translated_document_id :integer         not null, indexed
#  sequence               :float           not null
#  sentence_id            :integer         not null, indexed
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_sequences_on_sentence_id       (sentence_id)
#  index_sequences_on_document_lang_id  (translated_document_id)
#

