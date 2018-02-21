class TribesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @tribe = Tribe.where(id: current_user.tribe_id)
  end

  def new
    @tribe = Tribe.new
  end

  def create
    @tribe = Tribe.create(tribes_params)
    current_user.tribe_id = @tribe.id
    redirect_to "/tribes"
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
