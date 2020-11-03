# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:therapist) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
end
