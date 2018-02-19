class TribesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @tribe = Tribe.find(current_user.tribe_id) if current_user.tribe_id
  end

  def new
    @tribe = Tribe.new
  end

  def create
    @tribe = current_user.tribe.create(tribes_params)
    redirect_to "/users/#{current_user.id}/tribes"
  end

  def show
    @tribes = Tribe.all
  end

  def destroy
    @tribe = Tribe.find(params[:id])
    @tribe.destroy
  end

  private

  def tribes_params
    params.require(:tribe).permit(:id, :owner_id, :name)
  end
end
