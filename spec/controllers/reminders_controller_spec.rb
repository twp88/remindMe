require 'spec_helper'
require 'rails_helper'

RSpec.describe RemindersController, type: :controller do
  let!(:reminder) { create(:reminder, :standard_event) }
  let(:reminder2) { create(:reminder, :standard_event) }

  describe '#index' do
    it 'responds with 200 code' do
      get :index

      expect(response.code).to eq '200'
    end
  end

  describe '#delete' do
    it 'deletes the correct entry' do
      expect { delete :destroy, id: reminder }.to change(Reminder, :count)
        .by(-1)
    end
  end

  describe '#create' do
    it 'adds a new reminder' do
      expect { post :create, id: reminder2 }.to change(Reminder, :count)
        .by(1)
    end
  end
end
