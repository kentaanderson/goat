class ImportsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_category

	def import
		# need gear_category
		@import = Import.new
		@gears = Gear.where("user_id" => current_user.id).order("upper(name)")
		@category = Category.find(params[:category_id])
	end
	def import_pack
		# need gear_category
		@import = Import.new
		@gears = Gear.where("user_id" => current_user.id).order("upper(name)")
		@category = Category.find(params[:category_id])
	end
	def create
		event_id = session[:current_event_id]									# need event_id

		if params["gear_id"] != nil then
			gear_id = params["gear_id"]
			gear_id.each do |gear_id|
			# step 1 - create import records
		 	  	@import = Import.new
				@import.update_attributes({"user_id" => current_user.id, "gear_id" => gear_id.to_i, "event_id" => event_id}) 						
			# step 2 - move gear into pack_items
	 			@gear = Gear.find(gear_id.to_i)
	    		@pack_item = PackItem.new
				@pack_item.update_attributes(:name => @gear.name,:description => @gear.description,:year_acquired => @gear.year_acquired,:weight_oz => @gear.weight_oz,:weight_grams => @gear.weight_grams,:category_id => @gear.category_id,:manufacturer => @gear.manufacturer,:user_id => current_user.id, :event_id => event_id, :gear_id => gear_id.to_i)
			end

	  		 flash[:notice] = "Updated items from inventory!"
	  	end
	#  	  redirect_to pack_path(session[:current_event_id])	 							# event_id in session 
	  	  redirect_to pack_item_path(event_id)	 					# event_id in session 
	end

end

private

def import_params
  params.require(:import).permit(:user_id, :event_id, gear_id: [])
end

def check_category
  if params[:category_id] then		# if category_id is not nil, then put it in the session variable 
  	session[:current_category_id] = params[:category_id]
  end
end
