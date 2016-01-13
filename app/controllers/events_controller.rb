class EventsController < ApplicationController
	before_action :authenticate_user!
	def index
		session[:current_event_id] = 0														# kill the session variable for events
		@events = current_user.events.all.order(start_date: :desc)							# equivalent to 'where("user_id" => current_user.id)'
	end
	def new
	  @event = Event.new
	  session[:current_event_id] = 0  														# kill the session variable for events
	end
	def create
	  @event = Event.create(event_params)
	  EventAttendee.create("user_id" => current_user.id, "event_id" => @event.id)			# create the first, uneditable, association
	  redirect_to packs_path
	end
	def edit
	  @event = Event.find(params[:id])
	end
	def update
	  @event = Event.find(params[:id])
	  @event.update_attributes(event_params)
	  redirect_to packs_path
	end
	def destroy
	  @event = Event.find(params[:id])
	  @event.destroy
	  redirect_to packs_path	
	end
	private

	def event_params
	  params.require(:event).permit(:title, :start_date, :return_date, :map_url, :description, :comments, :summary, :event_type_id, :event_type_other, :sharing_status, :user_id) # might want to remove :user_id
	end

end
