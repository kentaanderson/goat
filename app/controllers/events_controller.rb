class EventsController < ApplicationController
	def index
		@events = Event.where("user_id" => current_user.id)
		  session[:current_event_id] = 0
	end
	def new
	  @event = Event.new
	end
	def create
	  event = Event.create(event_params)
	  if session[:current_event_id] > 0 then
		  redirect_to pack_path(session[:current_event_id])	
	  else
		  redirect_to events_path
	  end
	end
	def edit
	  @event = Event.find(params[:id])
	end
	def update
	  @event = Event.find(params[:id])
	  @event.update_attributes(event_params)
	  if session[:current_event_id] > 0 then
		  redirect_to pack_path(session[:current_event_id])	
	  else
		  redirect_to events_path
	  end
	end
	def destroy
	  @event = Event.find(params[:id])
	  @event.destroy
	  redirect_to events_path	
	end

	private

	def event_params
	  params.require(:event).permit(
	  	:title, 
		:start_date,
	  	:return_date, 
	  	:map_url,
	  	:description, 
	  	:comments, 
	  	:summary, 
	  	:event_type_id, 
	  	:event_type_other, 
	  	:sharing_status, 
	  	:user_id
	  	)
	end

end
