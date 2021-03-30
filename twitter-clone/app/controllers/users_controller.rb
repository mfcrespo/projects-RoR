class UsersController < ApplicationController
  include UserScoped
  
  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page:10)
  end

  def search
    if params[:followed].present?
      @follow = User.find_by(username: params[:followed])
      if @follow != current_user
        if current_user.following.include?(@follow)
          redirect_to search_path, alert: "You are following this user @#{user.username}"
        elsif !@follow
          redirect_to search_path, alert: "That user does not exist."
        else
          user_followed = Relationship.create(follower: current_user, followed: @follow)
          redirect_to user_path(@follow.username), notice: "You are not following this user @#{user.username}"
        end
      else
        redirect_to search_path, alert: "Invalid operation."
      end
    end
  end
 

end  


