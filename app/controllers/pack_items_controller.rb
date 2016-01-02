class PackItemsController < ApplicationController
	before_action :authenticate_user!
	def index
	end
	def new
	  @pack_item = PackItem.new
	  @category_id = params[:category_id]
	end
	def create
	  pack_item = PackItem.create(pack_item_params)
  	  redirect_to pack_path(session[:current_event_id]) 							# event_id in session
	end
	def edit
	  @pack_item = PackItem.find(params[:id])
	  @category_id = @pack_item.category_id
	end
	def import
		@gears = Gear.where("user_id" => current_user.id) 
	  	@pack_item = PackItem.find(params[:id])
	end
	def show
	  @pack_item = PackItem.find(params[:id])
	  @categories = Category.all
	end

	def update 																		# update pack_item
	  # THIS can probably be optimized with model associations and a :through reference, but the blunt-force method works, too
	  gear_id = 0																	# might need to review this line
	  																				# set gear_params to the relevant form fields
      gear_params = {name: pack_item_params[:name], description: pack_item_params[:description], weight_oz: pack_item_params[:weight_oz], year_acquired: pack_item_params[:year_acquired], category_id: pack_item_params[:category_id], manufacturer: pack_item_params[:manufacturer], user_id: current_user.id}
	  if pack_item_params[:inventory] == "1" then									# if saving checked, do save and grab gear_id
		if Gear.exists?(pack_item_params[:gear_id].to_i) then						# if this has been saved to inventory before...			
		  	gear_id = pack_item_params[:gear_id].to_i								# gear_id exists, so grab gear_id from params
		 	@gear = Gear.find(gear_id)												# get the gear object
		 	@gear.update_attributes(gear_params)									# update the gear inventory record
      	else
	  		@gear = Gear.create(gear_params)										# create a gear record
		  	gear_id = @gear.id 														# grab the new gear_id
		end
	  end

      # NO MATTER WHAT: UPDATE PACK_ITEM
 	  @pack_item = PackItem.find(params[:id])										# get the pack_item record to be updated
 	  @pack_item.update_attributes(pack_item_params)								# update the pack_item record with the form data elements
 	  @pack_item.update_attribute(:gear_id, gear_id)								# update the gear_id field separately (can't seem to update the params list)
  	  redirect_to pack_path(session[:current_event_id]) 							# event_id in session
  	  flash[:notice] = "Item added to pack!"
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

