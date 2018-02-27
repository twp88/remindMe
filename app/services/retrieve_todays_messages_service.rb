class RetrieveTodaysMessagesService
  def call
    messages
  end

  private

  def retrieve_reminders
    Reminder.today
  end

  def messages
    retrieve_reminders.map do |r|
      { "You have #{r.what} at #{r.time}, location: #{r.where}" => r }
    end
  end
end
