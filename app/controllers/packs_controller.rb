class PacksController < ApplicationController
	before_action :authenticate_user!
	def index
		@events = current_user.events.all
#		@events = Event.where("user_id" => current_user.id)
	end
	def new
#	  @pack = Pack.new
#      session[:current_event_id] = nil
	end
	def create
	  #pack = Pack.create(pack_params)
#      session[:current_pack_id] = nil
  	  #redirect_to packs_path
	end
	def edit
	  #@pack = Pack.find(params[:id])
	end
	def show
	  @event = Event.find(params[:id])
	  @categories = Category.all
	  session[:current_event_id] = @event.id
	end
	def update
  	  #@pack = Pack.find(params[:id])
  	  #@pack.update_attributes(pack_params)
  	  #redirect_to packs_path	
	end
	def destroy
	  #@pack = Pack.find(params[:id])
	  #@pack.destroy
      #session[:current_event_id] = nil						# this may not be necessary - just making sure it's really dead
   	  #redirect_to packs_path	
	end

end
private

def pack_params
#  params.require(:pack).permit(:name, :summary, :event_id, :gear_id, :user_id, :target_weight)
end
