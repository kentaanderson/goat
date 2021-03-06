class GearsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_category

	def index
		@categories = Category.all.order(item_order: :asc)
	end
	def new
	  @gear = Gear.new
	end
	def create
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

def check_category
  if params[:category_id] then		# if category_id is not nil, then put it in the session variable 
  	session[:current_category_id] = params[:category_id]
  end
end
