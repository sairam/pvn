class Sequence < ActiveRecord::Base
  belongs_to  :document
  has_one     :sentence

  def document_to_param
    document.to_param
  end

  def to_param
    self.sequence.to_s.sub('.','-')
  end

  def from_param(param)
    param.sub('-','.').to_f
  end

end
# == Schema Information
# Schema version: 20120311090412
#
# Table name: sequences
#
#  id          :integer         not null, primary key
#  document_id :integer         not null, indexed
#  sequence    :float           not null
#  created_at  :datetime
#  updated_at  :datetime
#
# Indexes
#
#  index_sequences_on_document_lang_id  (document_id)
#

