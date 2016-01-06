module EventAttendeesHelper
	def check_duplicate_attendee(friend_id)
		EventAttendee.where("user_id" => friend_id, "event_id" => session[:current_event_id]) 
	end

end
