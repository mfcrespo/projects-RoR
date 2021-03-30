class RelationshipsController < ApplicationController

  def create
    user = User.find(params[:followed_id])
    if current_user.follow(user)
		  flash[:success] = "You are following this user @#{user.username}"
		  redirect_to user_path(user.username)
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user_path(user.username), notice: "You are not following this user @#{user.username}"
  end

  
end
 
  