
# This is a comment
class RemindersController < ApplicationController
  before_action :authenticate_user!

  def index
    @reminders = current_user.reminders.all
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = current_user.reminders.create(reminders_params)
    redirect_to '/reminders'
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    flash[:notice] = 'Dearly beloved'
    redirect_to '/reminders'
  end

  def show
    MessageOrganizerService.new(current_user.phone_number).call
    redirect_to '/reminders'
  end

  private

  def reminders_params
    params.require(:reminder).permit(:what, :time, :where)
  end
end
