module PacksHelper

  def pack_event(event_id)
  	if Event.exists?(event_id)
	  @pack_event = Event.find(event_id)
      @pack_event.title
    else
      "no associated event"
    end
  end
end
