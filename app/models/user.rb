class User < ApplicationRecord
  validates_presence_of :username, :email

  has_many :appointments
end
