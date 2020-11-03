class TherapistsSpecialty < ApplicationRecord
  belongs_to :user
  belongs_to :specialty
end
