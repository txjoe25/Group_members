class MembersController < ApplicationController
  def index
  	@group = Group.find(params[:group_id])
  	@members = Member.new({group: group})
  end

  def create
  	 if Member.where(group_id: Group.find(params[:group_id]), user: current_user).count > 0
        redirect_to :back
      else
        new_member= Member.create(group: Group.find(params[:group_id]), user: current_user) 
        
        if new_member.save
          redirect_to :back
        else
          redirect_to :back
        end
    end
  end
  def show

  	@member = Member.all
  end

  def destroy
  	member = Member.find_by(user: current_user, group: Group.find(params[:id]))
    member.destroy
    redirect_to :back
  end
end
