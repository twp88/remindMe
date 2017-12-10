require 'spec_helper'
require 'rails_helper'

describe DateFilterService do
  subject { DateFilterService.new }
  let(:todays_event) { create(:reminder, :standard_event) }
  let(:tomorrows_event) { create(:reminder, time: Date.tomorrow) }

  context 'when called' do
    it 'returns a list of todays events' do
      expect(subject.call).to eq todays_event
    end
  end
end
