class Sequence < ActiveRecord::Base
  belongs_to :document_lang
  belongs_to :line
end