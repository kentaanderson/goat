class PackItemsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_category

	def index
	end
	def new
	  @pack_item = PackItem.new
	  @category_id = params[:category_id]
	end	
	def create
	  pack_item = PackItem.create(pack_item_params)

	  gear_id = inventory_add_update(pack_item_params)								# do the inventory thing

  	  redirect_to pack_item_path(session[:current_event_id])						# event_id in session
  	  flash[:notice] = "Item created!"
	end
	def edit
	  @pack_item = PackItem.find(params[:id])
	  @category_id = @pack_item.category_id
	end
	def import
		@gears = Gear.where("user_id" => current_user.id) 
	  	@pack_item = PackItem.find(params[:id])										# not sure what this is for, anymore
		flash[:notice] = "Selected item(s) imported!"

	end
	def show
		# This is currently dependent on the event_id to make the page work. That should be pack_id
	  @event = Event.find(params[:id])
	  @categories = Category.all.order(item_order: :asc)
	  session[:current_event_id] = @event.id 										# MIGHT NOT NEED THIS IF PACK_ID APPROACH PANS OUT

#	  if params[:c] then		# if category_id is not nil, then put it in the session variable 
#	  	session[:current_category_id] = params[:c]
#	  else
#	  	session[:current_category_id] = nil
#	  end

#	  @pack = Pack.find_or_initialize_by_current_event_id_and_user_id(session[:current_event_id], current_user.id)
	# this means there is ALWAYS a Pack object for each Event once the user has viewed the pack_items event 


	  pack_where = Pack.where("event_id" => @event.id, "user_id" => current_user.id)# lookup pack_id 
	  if pack_where.exists? then													# This is where the @pack is created/accessed
	  	@pack = Pack.find(pack_where.first.id)
	  else
	  	@pack = Pack.create("event_id" => @event.id, "user_id" => current_user.id, "name" => @event.title)	# create new pack, then get newly created pack_id
																					# do this as a default DB value
	  end

	end

#	def meals
#	  @event = Event.find(params[:id])
#	  @categories = Category.all
	  # session[:current_event_id] = @event.id 										# MIGHT NOT NEED THIS IF PACK_ID APPROACH PANS OUT
#	end 

	def update 																		# update pack_item
	  # THIS can probably be optimized with model associations and a :through reference, but the blunt-force method works, too
	  # MAYBE USE get_or_create - or something like that?
#	  gear_id = 0																	# might need to review this line
	  gear_id = inventory_add_update(pack_item_params)								# do the inventory thing

      # NO MATTER WHAT: UPDATE PACK_ITEM
 	  @pack_item = PackItem.find(params[:id])										# get the pack_item record to be updated
 	  @pack_item.update_attributes(pack_item_params)								# update the pack_item record with the form data elements
 	  @pack_item.update_attribute(:gear_id, gear_id)								# update the gear_id field separately (can't seem to update the params list)
  	  redirect_to pack_item_path(session[:current_event_id])	 					# event_id in session 
  	  flash[:notice] = "Item updated!"
	end

	def compare
		@event = Event.find(session[:current_event_id])
 	  	@event_attendees = EventAttendee.where("event_id" => @event.id)
	  	@categories = Category.all.order(item_order: :asc)
	end

	def destroy
	  @pack_item = PackItem.find(params[:id])
	  @pack_item.destroy
  	  redirect_to pack_item_path(session[:current_event_id])	 					# event_id in session 
	end
end
private

def inventory_add_update(pack_item_params)
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
  else
  	# do not delete inventory items for now
  end
  gear_id
end

def pack_item_params
  params.require(:pack_item).permit(:name, :description, :weight_oz, :year_acquired, :category_id, :manufacturer, :user_id, :event_id, :gear_id, :post_summary, :highlight, :wearing, :delivery, :pack_id, :item_count, :inventory, :sharing_status)
end

def check_category
  if params[:category_id] then		# if category_id is not nil, then put it in the session variable 
  	session[:current_category_id] = params[:category_id]
  end
end
