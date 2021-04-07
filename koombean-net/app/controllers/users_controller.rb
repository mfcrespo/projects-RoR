class UsersController < ApplicationController

	def show
		@user = User.find_by(username: params[:username])
	end
	    
	def index
		@users = User.all
	end
	    
	def new
		@user = User.new
		@user.links.build
	end
	    
	def edit
		@user = User.find_by(username: params[:username])
	end
	    
	def create
		@user = User.new(user_params)
		if @user.save
		  flash[:success] = "User successfully created"
		  redirect_to @user
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	end
	    
	def update
		@user = User.find_by(username: params[:username])
		if @user.update(user_params)
		  redirect_to @user, notice: "User was successfully updated"
		else
		  flash[:error] = "Something went wrong"
		  render 'edit'
		end
	end
	    
	def destroy
		@user = User.find_by(username: params[:username])
		if @user.destroy
		  flash[:success] = 'Object was successfully deleted.'
		  redirect_to users_url
		else
		  flash[:error] = 'Something went wrong'
		  redirect_to users_url
		end
	end
	      
	    
	private
	# Use callbacks to share common setup or constraints between actions.
	def set_user
	  @user = User.find_by(username: params[:username])
	end
	      
	def user_params
		params.require(:user).permit(:firstname, :lastname, :username, :city, :country, :phone, :bio, :area, :avatar, links_attributes: Link.attribute_names.map(&:to_sym).push(:_destroy))
	end
end

