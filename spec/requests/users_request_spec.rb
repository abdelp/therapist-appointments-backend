require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }
  let(:token) do
    post '/login', params: { username: users.last.username, password: '123456' }
    JSON.parse(response.body)['token']
  end

  describe 'POST /users' do
    let(:valid_attributes) { { username: 'AbdelP', email: 'abdel.perezpy@gmail.com', password: '123456' } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes, headers: { 'Authorization': "Bearer #{token}" } }

      it 'creates a user' do
        expect(json['user']['username']).to eq('AbdelP')
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { username: 'AbdelP' }, headers: { 'Authorization': "Bearer #{token}" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Email can't be blank/)
      end
    end
  end
end
