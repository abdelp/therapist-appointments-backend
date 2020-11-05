require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  let!(:user) { create(:user) }
  let(:user_id) { user.id }
  let!(:user_therapist) { create(:user) }
  let(:therapist_id) { user_therapist.id }
  let!(:therapist) { create(:therapist, user_id: user_therapist.id) }
  let!(:appointments) { create_list(:appointment, 20, user_id: user.id, therapist_id: therapist_id) }
  let(:id) { appointments.first.id }
  let(:token) do
    post '/login', params: { username: user.username, password: '123456' }
    JSON.parse(response.body)['token']
  end

  describe 'GET /users/:user_id/appointments' do
    before { get "/users/#{user_id}/appointments", params: {}, headers: { 'Authorization': "Bearer #{token}" } }

    context 'when user exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all user appointments' do
        expect(json.size).to eq(20)
      end
    end

    context 'when user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end

  describe 'GET /users/:user_id/appointments/:id' do
    before { get "/users/#{user_id}/appointments/#{id}", params: {}, headers: { 'Authorization': "Bearer #{token}" } }

    context 'when user appointment exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the appointment' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when user appointment does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Appointment/)
      end
    end
  end

  describe 'POST /users/:user_id/appointments' do
    let(:valid_attributes) do
      {
        user_id: user_id,
        therapist_id: therapist_id,
        start_at: '2020-10-01 10:00:00',
        end_at: '2020-10-01 11:00:00'
      }
    end

    context 'when request attributes are valid' do
      before do
        post "/users/#{user_id}/appointments",
             params: valid_attributes, headers: { 'Authorization': "Bearer #{token}" }
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/users/#{user_id}/appointments", params: {}, headers: { 'Authorization': "Bearer #{token}" } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Therapist must exist/)
      end
    end
  end

  describe 'PUT /users/:user_id/appointments/:id' do
    let(:valid_attributes) { { start_at: '2010-01-01' } }

    before do
      put "/users/#{user_id}/appointments/#{id}",
          params: valid_attributes,
          headers: { 'Authorization': "Bearer #{token}" }
    end
  end
end
