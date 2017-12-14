require 'twilio-ruby'

class SendMessageService
  def initialize(content)
    @content = content
  end

  def call
    @client = Twilio::REST::Client.new(
      Rails.application.secrets.twilio_account_sid,
      Rails.application.secrets.twilio_auth_token
    )

    message = @client.messages.create(
      body: @content,
      to: Rails.application.secrets.my_number,
      from: Rails.application.secrets.twilio_number
    )

    puts message.sid
  end
end
