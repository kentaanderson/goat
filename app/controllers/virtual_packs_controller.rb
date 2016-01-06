class VirtualPacksController < ApplicationController
# DO NOT ADD THIS LINE HERE: before_action :authenticate_user!

# index to list Virtual Packs on the Home screen?
# show to view Virtual Packs w/o authentication
  def show
  	# think of security -> if event is "private", do not display - but error gracefully
#  	event_id = 1
#  	user_id = 1
 	event_id = params[:id]
	user_id = params[:u]

	@event = Event.find(event_id)
	@categories = Category.all

	if Pack.where("event_id" => event_id, "user_id" => user_id).exists? then
		@pack = Pack.where("event_id" => event_id, "user_id" => user_id).order("upper(name)")			
	else
		Pack.create("event_id" => event_id, "user_id" => user_id)					
		@pack = Pack.where("event_id" => event_id, "user_id" => user_id).order("upper(name)")	
	end
  end

# other view to compare VPs?
# print picklist
end
