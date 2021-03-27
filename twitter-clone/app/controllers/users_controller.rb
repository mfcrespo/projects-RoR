class UsersController < ApplicationController
  include UserScoped
  #before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :following, :followers]

  def show
    @tweets = @user.tweets.paginate(page: params[:page], per_page:10)
  end
 

end  


