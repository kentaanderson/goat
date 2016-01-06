class EventAttendeesController < ApplicationController
	before_action :authenticate_user!
	def index
#		@events = current_user.events.all 											# list available events to select for adding
#		session[:current_event_id] = nil											# kill event_id in session
	end

	def edit 
		session[:current_event_id] = params[:id]	# to remember which event		# set selected event_id as session
		@event = Event.find(params[:id])			# get the event
		@event_attendee = EventAttendee.new			# for the form					# this is weird, but if I do the "find" method, it routes to "edit", not "create"
		@attendees = @event.users					# for removal
		attendees = []								# don't need this in the form
		@attendees.each do |user|
			attendees << user.id
		end
		@users = User.all.where('id NOT IN (?)',attendees) 	# for adding			# where not in @attendees, list available users
	end

	def create 

		friend_ids = params["friend_ids"]
		if friend_ids then
			friend_ids.each do |friend_id|
				dup = EventAttendee.exists?(user_id: friend_id, event_id: session[:current_event_id])
				if not dup then															# if no duplicates, then add the ids
					EventAttendee.create("user_id" => friend_id, "event_id" => session[:current_event_id])			
				end
			end
		end
		attendee_ids = params["attendee_ids"]										# remove selected attendees
		if attendee_ids then
			attendee_ids.each do |attendee_id|
				if EventAttendee.exists?(user_id: attendee_id, event_id: session[:current_event_id]) then
					@event_attendee = EventAttendee.where("user_id" => attendee_id, "event_id" => session[:current_event_id])			
					@event_attendee.delete(@event_attendee.first.id)
				end
			end
		end
		redirect_to edit_event_attendee_path(session[:current_event_id])	# return to this page to check results
	end

	private
	def event_attendee_params
	  params.require(:event_attendee).permit(:user_id, :event_id)
	end

end
