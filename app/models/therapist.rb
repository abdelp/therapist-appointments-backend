class Therapist < ApplicationRecord
  belongs_to :user
  has_many :appointments, foreign_key: :user_id
  validates :user_id, presence: true
end
