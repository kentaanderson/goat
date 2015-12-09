class PacksController < ApplicationController
	before_action :authenticate_user!
	def index
		@packs = Pack.where("user_id" => current_user.id)
	    session[:current_pack_id] = nil						# this may not be necessary
	end
	def new
	  @pack = Pack.new
#      session[:current_pack_id] = nil
	end
	def create
	  pack = Pack.create(pack_params)
#      session[:current_pack_id] = nil
  	  redirect_to packs_path
	end
	def edit
	  @pack = Pack.find(params[:id])
	end
	def show
	  @pack = Pack.find(params[:id])
	  @categories = Category.all
	  session[:current_pack_id] = @pack.id
	end
	def update
  	  @pack = Pack.find(params[:id])
  	  @pack.update_attributes(pack_params)
  	  redirect_to packs_path	
	end
	def destroy
	  @pack = Pack.find(params[:id])
	  @pack.destroy
      session[:current_pack_id] = nil						# this may not be necessary - just making sure it's really dead
   	  redirect_to packs_path	
	end
end
private

def pack_params
  params.require(:pack).permit(:name, :summary, :event_id, :gear_id, :user_id, :target_weight)
end
