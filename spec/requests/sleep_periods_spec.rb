require 'rails_helper'

RSpec.describe 'Sleep Periods API' do
  let!(:person) { create(:person) }
  let!(:sleep_periods) { create_list(:sleep_period, 10, person_id: person.id) }
  let(:person_id) { person.id }
  let(:id) { sleep_periods.first.id }

  describe 'GET /people/:person_id/sleep_periods' do
    before { get "/people/#{person_id}/sleep_periods" }

    context 'when person exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all sleep periods' do
        expect(json.size).to eq(10)
      end
    end

    context 'when person does not exist' do
      let(:person_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Person/)
      end
    end
  end

  describe 'GET /people/:person_id/sleep_periods/:id' do
    before { get "/people/#{person_id}/sleep_periods/#{id}" }

    context 'when sleep period exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the sleep period' do
        expect(json['id']).to eq(id)
      end
    end

    context 'when the sleep period does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SleepPeriod/)
      end
    end
  end

  describe 'POST /people/:person_id/sleep_periods' do
    let(:valid_attributes) do
      {
        started_at: 1.hour.ago,
        ended_at: DateTime.now,
        quality: 3,
        notes: 'Out like a baby'
      }
    end

    context 'when request attributes are valid' do
      before { post "/people/#{person_id}/sleep_periods", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post "/people/#{person_id}/sleep_periods", params: { foobar: 'this will fail' } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Started at can't be blank/)
      end
    end
  end

  describe 'PUT /people/:person_id/sleep_periods/:id' do
    let(:valid_attributes) { { notes: 'Updated note here' } }

    before { put "/people/#{person_id}/sleep_periods/#{id}", params: valid_attributes }

    context 'when sleep period exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the sleep period' do
        updated_sleep_period = SleepPeriod.find(id)
        expect(updated_sleep_period.notes).to match(/Updated note here/)
      end
    end

    context 'when the item does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find SleepPeriod/)
      end
    end
  end

  describe 'DELETE /people/:person_id/sleep_periods/:id' do
    before { delete "/people/#{person_id}/sleep_periods/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
