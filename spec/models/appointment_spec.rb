require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:therapist) }
  it { should validate_presence_of(:start_at) }
end
