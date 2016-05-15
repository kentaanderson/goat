class ComparatorsController < ApplicationController
	before_action :authenticate_user!
	before_action :kill_category

	def index
#	  @events = current_user.events.all.order(start_date: :desc)									# list available events to select for adding
# 	  Need a better method of listing by "groups" here once more users come on board
      @previous_packs = Pack.where("user_id" => current_user.id).order(updated_at: :desc)					# No filter for your own packs
      @packs = Pack.where("sharing_status = 2 AND user_id <> ?", current_user.id).order(updated_at: :desc)	# filter only shared packs

#	  @packs = current_user.packs.all 										# packs?
#  	  @packs = Pack.where("user_id" => current_user.id)						# option 3?

#	  @attendees = []														
#	  @events.each do |event| 
#		@attendees << event.user.id
#	  end
#	  session[:current_event_id] = nil										# kill event_id in session
	end

	def create
	  	@categories = Category.all.order(item_order: :asc)
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

private
	def kill_category
		session[:current_category_id] = nil
	end

end
