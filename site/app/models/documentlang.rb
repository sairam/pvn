class DocumentLang < ActiveRecord::Base
  belongs_to :document
  belongs_to :lang
  has_many :lines
  has_many :sequences
end