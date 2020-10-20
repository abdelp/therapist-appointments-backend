require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 10) }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns users' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
  end
end
