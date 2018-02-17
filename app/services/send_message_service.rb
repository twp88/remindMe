require 'twilio-ruby'

class SendMessageService
  def initialize(content, phone_number)
    @content = content
    @phone_number = phone_number
  end

  def call
    @client = Twilio::REST::Client.new(
      Rails.application.secrets.twilio_account_sid,
      Rails.application.secrets.twilio_auth_token
    )

    message = @client.messages.create(
      body: @content,
      to: @phone_number,
      from: Rails.application.secrets.twilio_number
    )

    puts message.sid
  end
end
