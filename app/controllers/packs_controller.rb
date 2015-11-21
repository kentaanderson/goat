class PacksController < ApplicationController
	before_action :authenticate_user!
	def index
		@packs = Pack.where("user_id" => current_user.id)
	end
	def new
	  @pack = Pack.new
	end
	def create
	  pack = Pack.create(pack_params)
  	  redirect_to packs_path
	end
	def edit
	  @pack = Pack.find(params[:id])
	end
	def show
	  @pack = Pack.find(params[:id])
	#  @pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => 2) #need to iterate through gear categories here
	  @categories = Category.all
	end
	def update
  	  @pack = Pack.find(params[:id])
  	  @pack.update_attributes(pack_params)
  	  redirect_to packs_path	
	end
	def destroy
	  @pack = Pack.find(params[:id])
	  @pack.destroy
   	  redirect_to packs_path	
	end
end
private

def pack_params
  params.require(:pack).permit(:name, :summary, :event_id, :gear_id, :user_id)
end
