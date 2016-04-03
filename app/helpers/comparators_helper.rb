module ComparatorsHelper

	def pack_weight_by_pack(pack_id)
		@pack_items = Pack.find(pack_id).pack_items
#		@pack_items = @pack.pack_items
		p "begin------------------"
		@pack_items.each do |item|
	
			p "x"
		end
		p "end------------------"
    	@category_weight = 0
	    if @pack_items.length > 0 then
	      @pack_items.each do |item|
	        @category_weight += item.weight_oz.to_d
	      end
	      @category_weight = @category_weight.to_s + " oz"
	    end
	end
  def pack_items_by_category_and_event(category_id, user_id, event_id)

     @pack_items = PackItem.where("category_id" => category_id, "user_id" => user_id, "event_id" => event_id).order("upper(name)") 
  end

  def pack_weight_by_category(category_id, user_id)
    @pack_items = PackItem.where("event_id" => @event.id, "category_id" => category_id, "user_id" => user_id)   # are we missing the user_id filter here, though?
    @category_weight = 0
    if @pack_items.length > 0 then
      @pack_items.each do |item|
        @category_weight += item.weight_oz.to_d
      end
      @category_weight = @category_weight.to_s + " oz"
    end
  end

	def event_title(event_id)
	  Event.find(event_id).title
	end
end
