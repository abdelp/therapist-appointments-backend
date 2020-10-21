class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist, primary_key: :user_id
end
