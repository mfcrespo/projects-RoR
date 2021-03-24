class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy, :following, :followers]

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.paginate(page: params[:page], per_page:10)
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page], per_page:10)
    
  end

  def following
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page], per_page:10)

  end  

end  


