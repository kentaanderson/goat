module PacksHelper
  def pack_event_title(event_id)
  	if Event.exists?(event_id)
	  @pack_event = Event.find(event_id)
      @pack_event.title
    else
      "no associated event"
    end
  end

  def pack_event_range                                      # returns a formatted string of the date range for an event_id 
    if Event.exists?(@pack.event_id)
      @event = Event.find(@pack.event_id)
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
      "n/a"                                                 # or if the event doen't exist (would this ever happen?)
    end
  end

  def pack_event_summary                                    # returns event summary, if it exists 
    if Event.exists?(@pack.event_id)
      @event = Event.find(@pack.event_id)
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
  def total_pack_weight
    @pack_items = PackItem.where("pack_id" => @pack.id)
    @total_weight = 0

    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @total_weight += item.weight_oz.to_f
      end
      ounces_to_lbs(@total_weight)
    end
  end 

private
  def ounces_to_lbs(total_oz)                   # this doesn't really need to be private, but I need to test out some Ruby/Rails features
      @ounces_weight = total_oz % 16                                 # get ounces as decimal
      @pounds_weight = ( total_oz - @ounces_weight ) / 16            # get pounds
      @total_weight = @pounds_weight.to_i.to_s + " lbs, " + @ounces_weight.to_i.to_s + " oz"

  end
end
