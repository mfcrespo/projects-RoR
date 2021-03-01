class KoombeansController < ApplicationController
	  
	def show
		@koombean = Koombean.find(params[:id])
	      end
	    
	      def index
		@koombeans = Koombean.all
	      end
	    
	      def new
		@koombean = Koombean.new
		@koombean.networks.build
	      end
	    
	      def edit
		@koombean = Koombean.find(params[:id])
	      end
	    
	      def create
		@koombean = Koombean.new(koombean_params)
		if @koombean.save
		  flash[:success] = "Koombean successfully created"
		  redirect_to @koombean
		else
		  flash[:error] = "Something went wrong"
		  render 'new'
		end
	      end
	    
	      def update
		@koombean = Koombean.find(params[:id])
		if @koombean.update(koombean_params)
		    flash[:success] = "Koombean was successfully updated"
		    redirect_to @koombean
		  else
		    flash[:error] = "Something went wrong"
		    render 'edit'
		  end
	      end
	    
	      def destroy
		@koombean = Koombean.find(params[:id])
		if @koombean.destroy
		  flash[:success] = 'Object was successfully deleted.'
		  redirect_to koombeans_url
		else
		  flash[:error] = 'Something went wrong'
		  redirect_to koombeans_url
		end
	      end
	      
	    
		    private
		# Use callbacks to share common setup or constraints between actions.
		def set_koombean
		  @koombean = Koombean.find(params[:id])
		end
	      
	      def koombean_params
		params.require(:koombean).permit(:firstname, :lastname, :city, :country, :phone, :bio, :area, :email, networks_attributes: Network.attribute_names.map(&:to_sym).push(:_destroy))
	      end
end
