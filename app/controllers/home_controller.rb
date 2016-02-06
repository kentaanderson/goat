class HomeController < ApplicationController
	def index
		@packs = Pack.all
	#	@packs = Pack.joins(:events).all
	#	@packs = Pack.includes(:events).all
	#	@packs = Event.packs.all 
		# IMPORTANT: why doesn't this work? Figure this out for max use of model associations.
		# is a rake db:action needed?
	end
end
