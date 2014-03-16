class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  acts_as_commentable
  acts_as_voter

  has_and_belongs_to_many :languages
  has_many :sentences
  has_many :comments
  has_many :documents

  # TODO add timezone to user
  # OPTIMIZE convert all datetime's to integers to that date can be stored in integer
end
# == Schema Information
# Schema version: 20120124141604
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  name                   :string(100)
#  email                  :string(255)     default(""), not null, indexed
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)     indexed
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#

