class TweetsController < ApplicationController
before_action :authenticate_user!, except: [:index]

	def show
		@tweet = Tweet.find(params[:id])
	end
	    
	def index
		if user_signed_in?
      @tweets = Tweet.where(user_id: current_user.following).or(Tweet.where(user_id: current_user)).paginate(page: params[:page], per_page: 10)
    else
      @tweets = Tweet.all.paginate(page: params[:page], per_page: 10)
    end
    @tweet = Tweet.new
    @users = User.all
    @user = current_user
	end
	    
	def new
		@tweet = current_user.tweets.build
	end
	    
	def edit
		@tweet = Tweet.find(params[:id])
	end
	    
	def create
		@tweet = current_user.tweets.build(tweet_params)
		if @tweet.save
		  flash[:success] = "Tweet successfully created"
		  redirect_to tweets_path
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end
	    
	def update
		@tweet = Tweet.find(params[:id])
		if @tweet.update(tweet_params)
		  redirect_to @tweet, notice: "Tweet was successfully updated"
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	    
	def destroy
		@tweet = Tweet.find(params[:id])
		if @tweet.destroy
		  flash[:success] = 'Object was successfully deleted.'
		  redirect_to tweets_url
		else
		  flash[:error] = 'Something went wrong'
		  redirect_to tweets_url
		end
	end
	      
	    
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_tweet
	  @tweet = Tweet.find(params[:id])
	end
	      
	def tweet_params
		params.require(:tweet).permit(:tweet)
	end	
end
