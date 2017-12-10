class DateFilterService
  def call
    Reminder.find_by(time: Date.today)
  end
end
