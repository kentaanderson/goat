class HomeController < ApplicationController
	before_action :kill_category
	def index

	# 	@events = Event.all	#where("sharing_status" => 2)
	#	p @events.first
		@packs = Pack.where("sharing_status" => 2).order(updated_at: :desc)
		@users = User.all.order(current_sign_in_at: :desc)
		@events = current_user.events.all.order(start_date: :desc)
		# IMPORTANT: why doesn't "Event.Pack...."" work? Figure this out for max use of model associations.
		# is a rake db:action needed?

		#!/usr/bin/env ruby


	end

private

	def kill_category
		session[:current_category_id] = nil
	end

end
