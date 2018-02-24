class TribesController < ApplicationController
  # before_action :authenticate_user!
  def index
    @tribe = Tribe.where(owner_id: current_user.id)
  end

  def new
    @tribe = Tribe.new
  end

  def create
    @tribe = Tribe.create(tribes_params)
    assign_ids(@tribe)
    redirect_to '/tribes'
  end

  def show
    @tribe = Tribe.find(params[:id])
    @tribe_members = @tribe.users
  end

  def destroy
    @tribe = Tribe.find(params[:id])
    @tribe.destroy
  end

  private

  def assign_ids(tribe)
    current_user.tribe_id = tribe.id
    tribe.owner_id = current_user.id
    tribe.save
  end

  def tribes_params
    params.require(:tribe).permit(:id, :owner_id, :name)
  end

  def tribe_member_params
    params.require(:tribe_member).permit(:id, :user_id, :tribe_id)
  end
end
