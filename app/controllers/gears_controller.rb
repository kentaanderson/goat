class GearsController < ApplicationController
	before_action :authenticate_user!
	def index
		@categories = Category.all
	end
	def new
	  @gear = Gear.new
	end
	def create
#		p gear_params
	  @gear = Gear.create(gear_params)
  	  redirect_to gears_path
	end
	def edit
	  @gear = Gear.find(params[:id])

	end
	def update
  	  @gear = Gear.find(params[:id])
  	  @gear.update_attributes(gear_params)
  	  redirect_to gears_path	
	end

	def destroy
	  @gear = Gear.find(params[:id])
	  @gear.destroy
  	  redirect_to gears_path	
	end

end
private

def gear_params
  params.require(:gear).permit(:name, :description, :weight_oz, :year_acquired, :category_id, :manufacturer, :user_id)
end


