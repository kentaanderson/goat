class EventsController < ApplicationController
	def index
		session[:current_event_id] = 0														# kill the session variable for events
		# Need to join EventAttendees here via model associations
		# and however this is done, do that same for Virtual Pack event selection screen
		@events = current_user.events.all						# where("user_id" => current_user.id)
	#	@events = Event.where("user_id" => current_user.id) 								# current method
	end
	def new
	  @event = Event.new
	end
	def create
	  p "---------- entered create"
	  @event = Event.create(event_params)
	  EventAttendee.create("user_id" => current_user.id, "event_id" => @event.id)			# create the first, uneditable, association
	  if session[:current_event_id] > 0 then
		  redirect_to pack_path(session[:current_event_id])
	  else
		  redirect_to events_path
	  end
	end
	def edit
	  p "---------- entered edit"
	  @event = Event.find(params[:id])
	end
	def update
	  p "---------- entered update"
	  @event = Event.find(params[:id])
	  @event.update_attributes(event_params)
	  if session[:current_event_id] > 0 then
		  redirect_to pack_path(session[:current_event_id])	
	  else
		  redirect_to events_path
	  end
	end
	def destroy
	  p "---------- entered destroy"
	  @event = Event.find(params[:id])
	  @event.destroy
	  redirect_to events_path	
	end

	private

	def event_params
	  params.require(:event).permit(:title, :start_date, :return_date, :map_url, :description, :comments, :summary, :event_type_id, :event_type_other, :sharing_status, :user_id) # might want to remove :user_id
	end

end
