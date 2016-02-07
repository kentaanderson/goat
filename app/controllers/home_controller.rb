class HomeController < ApplicationController
	def index
	#	@packs = Pack.all
	#	@packs = Pack.joins(:events).all
	#	@packs = Pack.includes(:events).all
		@events = Event.all	#where("sharing_status" => 2)
#		p @events.first
		@packs = Pack.where("sharing_status" => 2)
		p "----------------"
		p @packs
		p "----------------"
		# IMPORTANT: why doesn't this work? Figure this out for max use of model associations.
		# is a rake db:action needed?
	end
end
