require 'rails_helper'

RSpec.describe Therapist, type: :model do
  it { should belong_to(:user) }
end
