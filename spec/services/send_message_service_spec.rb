require 'spec_helper'

describe SendMessageService do
  subject { SendMessageService.new }

  # let(:message) { "This is an incredible message"}

  context 'when service is called' do
    it 'calls Twilio' do
      expect_any_instance_of(Twilio).to receive(::REST)
        # .and_return(twilio_double)
    end
  end
end
