class ImportsController < ApplicationController
	before_action :authenticate_user!
	def import
		# need gear_category
		@import = Import.new
		@gears = Gear.where("user_id" => current_user.id)
		@categories = Category.all
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
  	  	redirect_to pack_path(event_id)											# event_id in session
	end

end

private

def import_params
  params.require(:import).permit(:user_id, :event_id, gear_id: [])
end
