class PackItemsController < ApplicationController
	before_action :authenticate_user!
	def index
	end
	def new
	  @pack_item = PackItem.new
	end
	def create
	  pack_item = PackItem.create(pack_item_params)
  	  redirect_to pack_path(session[:current_event_id]) 							# event_id in session
	end
	def edit
	  @pack_item = PackItem.find(params[:id])
	end
	def import
		@gears = Gear.where("user_id" => current_user.id) 
	  	@pack_item = PackItem.find(params[:id])
#		@event = Event.find(params[:id])											# this is sketchy here
	end
	def show
	  @pack_item = PackItem.find(params[:id])
	  @categories = Category.all
	end

	def update
	  if pack_item_params[:gear_id].to_i > 0 then
	  	gear_id = pack_item_params[:gear_id].to_i									# if this has been saved to inventory before, grab gear_id
	  else
		  p pack_item_params[:gear_id].to_i											# if new, decide whether to save it to inventory
		  if pack_item_params[:inventory] == "1" then								# if saving checked, do save and grab gear_id
			gear_params = {name: pack_item_params[:name], description: pack_item_params[:description], weight_oz: pack_item_params[:weight_oz], year_acquired: pack_item_params[:year_acquired], category_id: pack_item_params[:category_id], manufacturer: pack_item_params[:manufacturer], user_id: current_user.id}
			@gear = Gear.create(gear_params)										
		  	gear_id = @gear.id 														
		  else
																					# don't save, and ignore gear_id
		  end
	  end
 	  @pack_item = PackItem.find(params[:id])
 	  @pack_item.update_attributes(pack_item_params)								# update the pack_item record
 	  @pack_item.update_attribute(:gear_id, gear_id)								# update the gear_id field separately (can't seem to update the params list)
  	  redirect_to pack_path(session[:current_event_id]) 							# event_id in session
	end

	def destroy
	  @pack_item = PackItem.find(params[:id])
	  @pack_item.destroy
  	  redirect_to pack_path(session[:current_event_id])	 							# event_id in session 
	end
end
private

def pack_item_params
  params.require(:pack_item).permit(:name, :description, :weight_oz, :year_acquired, :category_id, :manufacturer, :user_id, :event_id, :gear_id, :post_summary, :highlight, :wearing, :delivery, :pack_id, :item_count, :inventory)
end

