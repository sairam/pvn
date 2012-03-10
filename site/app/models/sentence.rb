class Sentence < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :translated_document

  has_one     :sequence
  validates_associated :sequence

  # OPTIMIZE: self reference to sentence_id
  belongs_to  :sentence
  has_many    :sentences

end
# == Schema Information
# Schema version: 20120310183149
#
# Table name: sentences
#
#  id                     :integer         not null, primary key
#  user_id                :integer         not null, indexed
#  sentence_id            :integer         indexed
#  translated_document_id :integer         not null, indexed => [is_approved], indexed
#  data                   :text            not null
#  is_approved            :boolean         indexed => [translated_document_id], indexed
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_sentences_on_sentence_id                (sentence_id)
#  index_lines_on_document_lang_id_and_approved  (translated_document_id,is_approved)
#  index_lines_on_approved                       (is_approved)
#  index_lines_on_document_lang_id               (translated_document_id)
#  index_lines_on_user_id                        (user_id)
#
