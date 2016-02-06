class WishlistsController < ApplicationController
	before_action :authenticate_user!
	def index
	  @categories = Category.all
	end
	def new
	  @wishlist = Wishlist.new
	end
	def create
#		p gear_params
	  @wishlist = Wishlist.create(wishlist_params)
  	  redirect_to wishlists_path
	end
	def edit
	  @wishlist = Wishlist.find(params[:id])

	end
	def update
  	  @wishlist = Wishlist.find(params[:id])
  	  @wishlist.update_attributes(wishlist_params)
  	  redirect_to wishlists_path	
	end

	def destroy
	  @wishlist = Wishlist.find(params[:id])
	  @wishlist.destroy
  	  redirect_to wishlists_path	
	end

end
private

def wishlist_params
  params.require(:wishlist).permit(:name, :description, :weight_oz, :link, :category_id, :manufacturer, :user_id)
end

