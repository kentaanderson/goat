class PacksController < ApplicationController
	before_action :authenticate_user!
	before_action :kill_category

	def index
	  @events = current_user.events.all.order(start_date: :desc)
	  session[:current_pack_id] = nil
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

	def kill_category
		session[:current_category_id] = nil
	end

	def pack_params
	  params.require(:pack).permit(:name, :summary, :event_id, :gear_id, :user_id, :target_weight, :sharing_status)
	end
