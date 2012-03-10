class Sequence < ActiveRecord::Base
  belongs_to  :translated_document
  belongs_to  :sentence

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

