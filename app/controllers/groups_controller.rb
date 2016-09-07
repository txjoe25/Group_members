class GroupsController < ApplicationController
  def index
    @member = Member.all
    @group = Group.all
  end

  def new
  end

  def create
      group = Group.create(group_params)
      member = Member.create(group: group, user: current_user)
      group.user = current_user
      if group.save
        member.save
        redirect_to :back
      else
        puts group.errors.messages
        redirect_to :back
      end
  end

  def show
        @group = Group.find(params[:id])
        @member = Member.where(group: @group)
  end

  def update
  end

  def destroy
    group = Group.find_by(user: current_user).destroy
    redirect_to '/groups'
  end
  private
  def group_params
    params.require(:group).permit(:name, :description)
  end
end
