class EventAttendeesController < ApplicationController
	def index
		@events = current_user.events.all 											# list available events to select for adding
	end
	def new
		# need a "friends list" instead of users
		@users = User.all 															# list available users
	  # @event_attendee = EventAttendee.new											# don't think I need this
	end
	def edit 
		session[:current_event_id] = params[:id]
		@event = Event.find(params[:id])
		@event_attendee = EventAttendee.new											# this is weird, but if I do the "find" method, it routes to "edit", not "create"
		@users = User.all 															# list available users
	end
	def update

		p "made it to UPDATE ********************* "
	end

	def create 
		friend_ids = params["friend_ids"]
		friend_ids.each do |friend_id|
			# test - later check to see if they are already in the event?
			# this creates duplicate records in event_attendees
			EventAttendee.create("user_id" => friend_id, "event_id" => session[:current_event_id])			
		end
		redirect_to events_path														
	end
	
	def destroy
	  @event_attendee = EventAttendee.find(params[:id])								# un-associate the user with the event (probably with a better lookup, not the :id)
	  @event_attendee.destroy
	  redirect_to events_path														# should clarify to where this should point
	end

	private
	def event_attendee_params
	  params.require(:event_attendee).permit(:user_id, :event_id)
	end

end
