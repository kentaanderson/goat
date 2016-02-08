class HomeController < ApplicationController
	def index
	# 	@events = Event.all	#where("sharing_status" => 2)
#		p @events.first
		@packs = Pack.where("sharing_status" => 2)
		# IMPORTANT: why doesn't "Event.Pack...."" work? Figure this out for max use of model associations.
		# is a rake db:action needed?
	end
end
