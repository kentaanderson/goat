class HomeController < ApplicationController
	def index
		@packs = Pack.all
#		@packs = Event.Pack.all # IMPORTANT: why doesn't this work? Figure this out for max use of model associations.
	end
end
