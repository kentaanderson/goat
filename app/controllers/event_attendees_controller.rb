class EventAttendeesController < ApplicationController
	def new
	  @event_attendee = EventAttendee.new
	end
	def create
	  p "---------- entered create event_attendee"
	  EventAttendee.create(event_attendee_params)
	end
	
	def destroy
	  p "---------- entered destroy"
	  @event_attendee = EventAttendee.find(params[:id])
	  @event_attendee.destroy
	  redirect_to events_path														# should clarify to where this should point
	end

	private
	def event_attendee_params
	  params.require(:event_attendee).permit(:user_id, :event_id)
	end

end
