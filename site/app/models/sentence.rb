class Sentence < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :document

  belongs_to  :translated_document

  belongs_to     :sequence
  validates_associated :sequence

  # OPTIMIZE: self reference to sentence_id
  belongs_to  :sentence
  has_many    :sentences

  acts_as_commentable

  def language
    self.translated_document.language
  end

  def approve!
    # find all the sentences that are approved for this and remove the approval for them
    other_sentence = Sentence.find_all_by_translated_document_id_and_sentence_id(self.translated_document_id, self.sentence_id)

    Sentence.transaction do
      other_sentence.map{|x| x.decline!}
    end
    self.is_approved = true
    save!
  end

  def decline
    self.is_approved = false
  end

  def decline!
    self.decline
    save!
  end

end
# == Schema Information
# Schema version: 20120311090412
#
# Table name: sentences
#
#  id                     :integer         not null, primary key
#  user_id                :integer         not null, indexed
#  sentence_id            :integer         indexed
#  translated_document_id :integer         not null, indexed, indexed => [is_approved]
#  data                   :text            not null
#  is_approved            :boolean         indexed => [translated_document_id], indexed
#  created_at             :datetime
#  updated_at             :datetime
#  sequence_id            :integer
#
# Indexes
#
#  index_lines_on_user_id                        (user_id)
#  index_lines_on_document_lang_id               (translated_document_id)
#  index_lines_on_document_lang_id_and_approved  (translated_document_id,is_approved)
#  index_sentences_on_sentence_id                (sentence_id)
#  index_lines_on_approved                       (is_approved)
#

