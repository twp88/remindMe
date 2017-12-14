require 'spec_helper'
require 'rails_helper'

describe MessageOrganizerService do
  subject { MessageOrganizerService.new }

  let(:reminder) { create(:reminder, :standard_event) }
  let(:reminder_two) { create(:reminder, time: Date.tomorrow) }

  context 'when called' do
    it 'orginzes the messages' do
      expect(subject.call).to eq
    end
  end
end
