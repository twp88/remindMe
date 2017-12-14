
# This is a comment
class RemindersController < ApplicationController
  def index
    @reminders = Reminder.all
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = Reminder.create(reminders_params)
    redirect_to '/reminders'
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    flash[:notice] = "Dearly beloved"
    redirect_to '/reminders'
  end

  def show
    MessageOrganizerService.new.call
    redirect_to '/reminders'
  end

private
  def reminders_params
    params.require(:reminder).permit(:what, :time, :where)
  end
end
