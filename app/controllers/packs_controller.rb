class PacksController < ApplicationController
	before_action :authenticate_user!
	def index
	  @events = current_user.events.all.order(start_date: :desc)
	  session[:current_pack_id] = 0
	end

	# 1:1 relationship with event_id / user_id, so create or edit = same thing
	def new
	  @pack = Pack.new
	end
	def create
	  pack = Pack.create(pack_params)
  	  redirect_to pack_item_path(session[:current_event_id])
	end
	def edit
	  @pack = Pack.find(params[:id])
	end
	def update
  	  @pack = Pack.find(params[:id])
  	  @pack.update_attributes(pack_params)
  	  redirect_to pack_item_path(session[:current_event_id])
	end
	def destroy
	  @pack = Pack.find(params[:id])
	  @pack.destroy
  	  redirect_to pack_item_path(session[:current_event_id])
	end

end
private

def pack_params
  params.require(:pack).permit(:name, :summary, :event_id, :gear_id, :user_id, :target_weight)
end
