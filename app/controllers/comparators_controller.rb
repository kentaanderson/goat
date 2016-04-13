class ComparatorsController < ApplicationController
	before_action :authenticate_user!
	
	def index
#	  @events = current_user.events.all.order(start_date: :desc)			# list available events to select for adding
      @previous_packs = Pack.where("user_id" => current_user.id).order(name: :asc)
      @packs = Pack.where("sharing_status = 2 AND user_id <> ?", current_user.id).order(name: :asc)

#	  @packs = current_user.packs.all 										# packs?
#  	  @packs = Pack.where("user_id" => current_user.id)						# option 3?

#	  @attendees = []														
#	  @events.each do |event| 
#		@attendees << event.user.id
#	  end
#	  session[:current_event_id] = nil										# kill event_id in session
	end

	def create
	  	@categories = Category.all
	  	pack_ids = params["packs"]
	  	@packs = []
	  	# add in other pack categories here
		if pack_ids then
			pack_ids.each do |pack_id|
				pack = Pack.find(pack_id)
				@packs << pack
			end
		end
	end

	def edit

	end

	def update

	end

	def show



	end


end
