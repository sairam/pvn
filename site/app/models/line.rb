class Line < ActiveRecord::Base
  belongs_to :user
  belongs_to :user_lang
  
  has_one :sequence

  # OPTIMIZE: self reference to line_id
  belongs_to :line
  has_many :lines

end