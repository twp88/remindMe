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
      m.each do |k, v|
        numbers = CollateTribeNumbersService.new(v).call
        numbers.each { |n| SendMessageService.new(k, n).call }
      end
    end
  end
end
