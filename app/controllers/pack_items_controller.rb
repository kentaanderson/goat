class PackItemsController < ApplicationController
	before_action :authenticate_user!
	def index
	end
	def new
	  @pack_item = PackItem.new
	end
	def create
	  pack_item = PackItem.create(pack_item_params)
  	  redirect_to pack_path(session[:current_pack_id]) 							# pack_id in session
	end
	def edit
	  @pack_item = PackItem.find(params[:id])
	end
	def show
	  @pack_item = PackItem.find(params[:id])
	end
	def update
 	  @pack_item = PackItem.find(params[:id])
 	  @pack_item.update_attributes(pack_item_params)
  	  redirect_to pack_path(session[:current_pack_id]) 							# pack_id in session
	end
	def destroy
	  @pack_item = PackItem.find(params[:id])
	  @pack_item.destroy
  	  redirect_to pack_path(session[:current_pack_id])	 						# pack_id in session
	end
end
private

def pack_item_params
  params.require(:pack_item).permit(:name, :description, :post_summary, :weight_oz, :event_id, :gear_id, :user_id, :wearing, :delivery, :category_id, :highlight, :manufacturer, :year_acquired, :pack_id, :item_count)
end

