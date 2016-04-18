module ComparatorsHelper

	def pack_weight_by_pack(pack_id, wearing_flag, delivery_flag)
		@pack = Pack.find(pack_id)
	# connect to pack_items through event_id (oops - need to add pack_id as FK in pack_items, rather than event_id - MANY model changes there)
	#	@local_event = Event.find(@pack.event_id)
		@pack_items = PackItem.where("user_id" => @pack.user_id, "event_id" => @pack.event_id, "wearing" => wearing_flag, "delivery" => delivery_flag)
		@total_weight = 0
	    if @pack_items.length > 0 then
	      @pack_items.each do |item|
	        @total_weight += item.weight_oz.to_d
	      end
	      ounces_to_lbs(@total_weight)
	    end

	end

  def pack_items_by_category_and_event(category_id, user_id, event_id)

     @pack_items = PackItem.where("category_id" => category_id, "user_id" => user_id, "event_id" => event_id, "sharing_status" => 2).order("upper(name)") 
  end

  def category_weight_by_pack(category_id, pack_id)
		@pack = Pack.find(pack_id)
	# connect to pack_items through event_id (oops - need to add pack_id as FK in pack_items, rather than event_id - MANY model changes there)
	#	@local_event = Event.find(@pack.event_id)
		@pack_items = PackItem.where("user_id" => @pack.user_id, "event_id" => @pack.event_id, "category_id" => category_id)
		@total_weight = 0
	    if @pack_items.length > 0 then
	      @pack_items.each do |item|
	        @total_weight += item.weight_oz.to_d
	      end
	      ounces_to_lbs(@total_weight)
	    end
  end

	def event_title(event_id)
	  Event.find(event_id).title
	end
end
