class MessageOrganizerService
  def initialize(phone_number)
    @phone_number = phone_number
  end

  def call
    send_each_message
  end

  private

  def messages
    RetrieveTodaysMessagesService.new.call
  end

  def send_each_message
    messages.each do |m|
      SendMessageService.new(m, @phone_number).call
    end
  end
end
