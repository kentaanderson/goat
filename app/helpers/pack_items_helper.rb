module PackItemsHelper

 def pack_event_range(event_start_date,event_return_date)  # returns a formatted string of the date range for an event_id 

      if event_start_date.is_a?(Date) then                 # If start_date is legit, then parse it
        event_start_date = event_start_date.strftime("%m/%d/%Y").to_s + " - "
      else
        event_start_date = "? - "                          # if not, return appropriate string "? - "
      end
      if event_return_date.is_a?(Date) then                # If return_date is legit, then parse it
        event_return_date = event_return_date.strftime("%m/%d/%Y").to_s
      else
        event_return_date = "?"                            # if not, return appropriate string "?"
      end
      event_start_date + event_return_date                # combine the two string responses and return
  end

  # THIS SHOULD TAKE IN A PARAMETER, NOT RELY ON THE @event ActiveRecord

  def wearing_weight_by_category(category_id)
    @pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => category_id, "wearing" => 1)
    @category_weight = 0
    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @category_weight += item.weight_oz.to_f
      end
      @category_weight = @category_weight.to_s + " oz"
    end
  end
  def delivery_weight_by_category(category_id)
    @pack_items = PackItem.where("pack_id" => @pack.id, "category_id" => category_id, "delivery" => 1)
    @category_weight = 0
    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @category_weight += item.weight_oz.to_f
      end
      @category_weight = @category_weight.to_s + " oz"
    end
  end
  def total_pack_weight
    # because apparently you can't retrieve NULL values without explicitly asking for them
    @pack_items = PackItem.where("event_id = ? AND (wearing != 1) AND (delivery != 1)", @event.id)
    @total_weight = 0

    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @total_weight += item.weight_oz.to_f
      end
      ounces_to_lbs(@total_weight)
    else
      "n/a"
    end
  end 
  def total_wearing_weight
    @pack_items = PackItem.where("event_id" => @event.id, "wearing" => 1)
    @total_weight = 0

    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @total_weight += item.weight_oz.to_f
      end
      ounces_to_lbs(@total_weight)
    else
      "n/a"
    end
  end 
  def total_delivery_weight
    @pack_items = PackItem.where("event_id" => @event.id, "delivery" => 1)
    @total_weight = 0

    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @total_weight += item.weight_oz.to_f
      end
      ounces_to_lbs(@total_weight)
    else
      "n/a"
    end
  end 

  def target_weight
    if @pack.first.target_weight.to_s.length > 0 then
      @pack.first.target_weight.to_s + " lbs"
    else
      "n/a"
    end
  end 

  def pack_name
  	@pack.first.name
  end

  def pack_items_by_category(category_id)
      @pack_items = PackItem.where("event_id" => @event.id, "category_id" => category_id).order("upper(name)")
  end

  def pack_weight_by_category(category_id)
    @pack_items = PackItem.where("event_id" => @event.id, "category_id" => category_id)
    @category_weight = 0
    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @category_weight += item.weight_oz.to_f
      end
      @category_weight = @category_weight.to_s + " oz"
    end
  end

private
  def ounces_to_lbs(total_oz)                                        # this doesn't really need to be private, but I need to test out some Ruby/Rails features
      @ounces_weight = total_oz % 16                                 # get ounces as decimal
      @pounds_weight = ( total_oz - @ounces_weight ) / 16            # get pounds
      @total_weight = @pounds_weight.to_i.to_s + " lbs, " + @ounces_weight.to_i.to_s + " oz"

  end
end
