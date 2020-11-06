class User < ApplicationRecord
  validates_presence_of :username, :email
  validates :username, uniqueness: true
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :appointments
  has_one :therapist, dependent: :destroy

  has_secure_password
end
