class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  acts_as_commentable
  acts_as_voter

  has_many :user_langs
  has_many :sentences
  has_many :comments

  def name
    "#{first_name} #{last_name}"
  end

end

# TODO add timezone to user
# OPTIMIZE convert all datetime's to integers to that date can be stored in integer
# create_table "users", :force => true do |t|
#   t.string   "first_name",             :limit => 100
#   t.string   "last_name",              :limit => 100
#   t.string   "username",               :limit => 30
#   t.string   "email",                                 :default => "", :null => false
#   t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
#   t.string   "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.integer  "sign_in_count",                         :default => 0
#   t.datetime "current_sign_in_at"
#   t.datetime "last_sign_in_at"
#   t.string   "current_sign_in_ip"
#   t.string   "last_sign_in_ip"
#   t.datetime "created_at"
#   t.datetime "updated_at"
# end
#
# add_index "users", ["email"], :name => "index_users_on_email", :unique => true
# add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
