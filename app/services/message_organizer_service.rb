class MessageOrganizerService
  def call
    send_each_message
  end

  private

  def messages
    RetrieveTodaysMessagesService.new.call
  end

  def send_each_message
    messages.each do |m|
      SendMessageService.new(m).call
    end
  end
end
