
# This is a comment
class RemindersController < ApplicationController
  before_action :authenticate_user!

  def index
    @reminders = current_user.reminders.all
  end

  def new
    @reminder = Reminder.new
    @tribes = Tribe.where(owner_id: current_user.id)
  end

  def create
    @reminder = current_user.reminders.create(reminders_params)
    redirect_to '/reminders'
  end

  def edit
    @reminder = Reminder.find(params[:id])
    @tribes = Tribe.where(owner_id: current_user.id)
  end

  def update
    @reminder = Reminder.find(params[:id])
    @reminder.update_attributes(reminders_params)
    redirect_to '/reminders'
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    flash[:notice] = 'Dearly beloved'
    redirect_to '/reminders'
  end

  def show
    # Here use new service to collect tribe numbers
    # Pass these numbers to the following service
    MessageOrganizerService.new.call
    redirect_to '/reminders'
  end

  private

  def reminders_params
    params.require(:reminder).permit(:what, :time, :where, :tribe_id)
  end
end
