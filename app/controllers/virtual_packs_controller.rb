class VirtualPacksController < ApplicationController
# DO NOT ADD THIS LINE HERE: before_action :authenticate_user!

# index to list Virtual Packs on the Home screen?
# show to view Virtual Packs w/o authentication
  def show

	pack_id = params[:vp]

	@pack = Pack.find(pack_id)
	# make this automatic with model associations then you can call "@pack.event..."
	@event = Event.find(@pack.event_id)
	@categories = Category.all

  end

# other view to compare VPs?
# print picklist
end
