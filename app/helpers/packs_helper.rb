module PacksHelper

  def pack_event(event_id)
  	if Event.exists?(event_id)
	  @pack_event = Event.find(event_id)
      @pack_event.title
    else
      "no associated event"
    end
  end

  def pack_items_by_category(category_id)
  	@pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => category_id)
  end

  def pack_id
    1
  end


end
