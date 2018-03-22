class SearchController < ApplicationController
  def search
    if params[:q].nil?
      @reminders = []
    else
      @reminders = Reminder.search(params[:q])
    end
  end
end
