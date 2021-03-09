class TweetsController < ApplicationController

	def show
		@tweet = Tweet.find(params[:id])
	end
	    
	def index
		@tweets = Tweet.all
	end
	    
	def new
		@tweet = Tweet.new
	end
	    
	def edit
		@tweet = Tweet.find(params[:id])
	end
	    
	def create
		@tweet = Tweet.new(tweet_params)
		if @tweet.save
		  flash[:success] = "Tweet successfully created"
		  redirect_to @tweet
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
