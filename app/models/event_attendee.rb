class EventAttendee < ActiveRecord::Base
	belongs_to :event, :class_name => "Event"
	belongs_to :user, :class_name => "User"
end
