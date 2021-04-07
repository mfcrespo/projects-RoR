class TraineesController < ApplicationController

	def show
	  @trainee = Trainee.find(params[:id])
	end
      
	def index
	  @trainees = Trainee.all
	end
      
	def new
	  @trainee = Trainee.new
	  @trainee.networks.build
	end
      
	def edit
	  @trainee = Trainee.find(params[:id])
	end  
      
	def create
	  @trainee =Trainee.new(params.require(:trainee).permit(:firstname, :lastname, :city, :country, :phone, :bio, :preference, :email))
	  if @trainee.save
	    flash[:notice] = "You have successfully registered"
	    redirect_to @trainee
	  else
	    render 'new'
	  end
	    
	end
	
	def update
	  @trainee = Trainee.find(params[:id])
	  if @trainee.update(params.require(:trainee).permit(:firstname, :lastname, :city, :country, :phone, :bio, :preference, :email))
	    flash[:notice] = "Trainee was updated successfully"
	    redirect_to @trainee
	  else
	    render 'edit'
	  end  
	end
      
	def destroy
	  @trainee = Trainee.find(params[:id])
	  @trainee.destroy
	  redirect_to trainees_path
	end  
	
	private
		def trainee_params
		  params.require(:trainee).permit(:firstname, :lastname, :city, :country, :phone, :bio, :preference, :email, networks_attributes: Network.attribute_names.map(&:to_sym).push(:_destroy))
		end  
      
end

