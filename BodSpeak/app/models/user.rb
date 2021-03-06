# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  has_one :patient_info
  attr_accessible :name, :email, :password, :password_confirmation,:user_type,:patient_infos_attributes
  has_secure_password
  has_many :messages, dependent: :destroy
  

  accepts_nested_attributes_for :patient_info

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  before_save :default_value

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
	
	def default_value
	self.user_type ||= 'P'
	end
end
