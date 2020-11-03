# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TherapistsSpecialty, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:specialty) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:specialty) }
end
