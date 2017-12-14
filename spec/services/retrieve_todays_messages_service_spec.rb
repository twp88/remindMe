require 'spec_helper'
require 'rails_helper'

describe RetrieveTodaysMessagesService do
  subject { RetrieveTodaysMessagesService.new }
  let!(:todays_event) { create(:reminder, :standard_event) }
  let!(:todays_event_copy) { create(:reminder, :standard_event) }

  let(:correct_sentence) do
    ["You have #{todays_event.what} at #{todays_event.time}, location: #{todays_event.where}",
     "You have #{todays_event.what} at #{todays_event.time}, location: #{todays_event.where}"]
  end

  context 'when called' do
    it 'returns correct sentence' do
      expect(subject.call).to eq correct_sentence
    end
  end
end
