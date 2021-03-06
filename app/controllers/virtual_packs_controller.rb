class VirtualPacksController < ApplicationController
	before_action :kill_category

# DO NOT ADD THIS LINE HERE: before_action :authenticate_user!

# index to list Virtual Packs on the Home screen?
# show to view Virtual Packs w/o authentication
  def show

	pack_id = params[:vp]
	@pack = Pack.find(pack_id)
#	if @pack.user_id == current_user.id then
	  # make this automatic with model associations then you can call "@pack.event..."
	  @user_id = @pack.user_id
	  @event = Event.find(@pack.event_id)
	  @categories = Category.all.order(item_order: :asc)
#	else
# 	  redirect_to home_path
#	end

  end

  def picklist
	@pack = Pack.find(params[:pack_id])
	if @pack.user_id == current_user.id then
	  # make this automatic with model associations then you can call "@pack.event..."
	  @user_id = @pack.user_id
	  @event = Event.find(@pack.event_id)
	  @categories = Category.all.order(item_order: :asc)
	else
  	  redirect_to home_path
	end
  end



private
	def kill_category
		session[:current_category_id] = nil
	end

end
