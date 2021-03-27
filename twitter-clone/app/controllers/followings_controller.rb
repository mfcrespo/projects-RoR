class FollowingsController < ActionController::Base
  include UserScoped

	def show
    @users = @user.following.paginate(page: params[:page], per_page:10)
  end

end
