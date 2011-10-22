class Document < ActiveRecord::Base

  has_many :document_langs
  has_many :lines , :through => :document_langs
  belongs_to :user

  acts_as_votable

end