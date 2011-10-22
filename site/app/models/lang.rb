class Lang < ActiveRecord::Base
  has_many :user_langs
  has_many :document_langs
end