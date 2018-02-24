class TribeMembersController < ApplicationController
  before_action :set_tribe_member, only: [:show, :edit, :update, :destroy]

  def index
    @tribe_members = TribeMember.all
  end

  def show
  end

  def new
    @potential_members = User.all
    @tribe_member = TribeMember.new
    session[:passed_tribe_id] = params[:tribe_id]
  end

  def edit
  end

  def create
    @tribe_member = TribeMember.new(tribe_member_params)
    @tribe_member.tribe_id = session[:passed_tribe_id]
    @tribe_member.save!
    redirect_to new_tribe_member_path
  end

  def update
    @tribe_member.update(tribe_member_params)
  end

  def destroy
    @tribe_member.destroy
  end

  private

    def set_tribe_member
      @tribe_member = TribeMember.find(params[:id])
    end

    def tribe_member_params
      params.require(:tribe_member).permit(:user_id, :tribe_id)
    end
end
