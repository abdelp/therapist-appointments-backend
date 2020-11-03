require 'rails_helper'

RSpec.describe 'Therapists', type: :request do
  let!(:users) { create_list(:user, 10) }
  let!(:therapists) { create_list(:therapist, 10) }
  let(:user_id) { therapists.first.user_id }
  let(:token) do
    post '/login', params: { username: users.last.username, password: '123456' }
    JSON.parse(response.body)['token']
  end

  describe 'GET /therapists' do
    before { get '/therapists' }

    it 'returns therapists' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /therapists/:id' do
    before { get "/therapists/#{user_id}" }

    context 'when the record exists' do
      it 'returns the user' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:user_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Therapist/)
      end
    end
  end

  describe 'POST /therapists' do
    context 'when the request is invalid' do
      before { post '/therapists', params: { username: 'AbdelP' }, headers: { 'Authorization': "Bearer #{token}" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: User must exist/)
      end
    end
  end

  describe 'PUT /therapists/:id' do
    let(:valid_attributes) { { username: 'AbdelP', email: 'abdel.perezpy@gmail.com' } }

    context 'when the record exists' do
      before { put "/therapists/#{user_id}",
       params: valid_attributes,
       headers: { 'Authorization': "Bearer #{token}" } }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /therapists/:id' do
    before { delete "/therapists/#{user_id}", params: {}, headers: { 'Authorization': "Bearer #{token}" } }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
