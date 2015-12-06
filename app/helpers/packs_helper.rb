module PacksHelper
  def pack_event(event_id)
  	if Event.exists?(event_id)
	  @pack_event = Event.find(event_id)
      @pack_event.title
    else
      "no associated event"
    end
  end

  def pack_event_range(event_id)                            # returns a formatted string of the date range for an event_id 
    if Event.exists?(event_id)
      @event = Event.find(event_id)
      @event_start_date = @event.start_date
      @event_return_date = @event.return_date
      if @event_start_date.is_a?(Date) then                 # If start_date is legit, then parse it
        @event_start_date = Date.strptime(@event_start_date.to_s, "%Y-%m-%d")
        @event_start_date = @event_start_date.strftime("%m/%d/%Y").to_s + " - "
      else
        @event_start_date = "? - "                          # if not, return appropriate string "? - "
      end
      if @event_return_date.is_a?(Date) then                # If return_date is legit, then parse it
        @event_return_date = Date.strptime(@event_return_date.to_s, "%Y-%m-%d")
        @event_return_date = @event_return_date.strftime("%m/%d/%Y").to_s
      else
        @event_return_date = "?"                            # if not, return appropriate string "?"
      end
      @event_start_date + @event_return_date                # combine the two string responses and return
    else
      "n/a"                         # or if the event doen't exist (would this ever happen?)
    end
  end

  def pack_event_summary(event_id)                          # returns event summary, if it exists 
    if Event.exists?(event_id)
      @event = Event.find(event_id)
      @event.summary
    else
      "n/a"
    end

  end

  def pack_items_by_category(category_id)
  	@pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => category_id)
  end
  def pack_weight_by_category(category_id)
    @pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => category_id)
    @category_weight = 0
    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @category_weight += item.weight_oz.to_f
      end
      @category_weight = @category_weight.to_s + " oz"
    end
  end
end
