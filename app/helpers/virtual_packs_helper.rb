module VirtualPacksHelper
  def open_pack_target_weight(pack)
#  	pack.first.target_weight
  	pack.target_weight
  end

  def open_pack_name(pack)
#  	pack.first.name
  	pack.name
  end

  def pack_items_by_category_filtered(category_id, user_id)
      @pack_items = PackItem.where("event_id" => @event.id, "category_id" => category_id, "user_id" => user_id, "sharing_status" => 2).order("upper(name)") 
  end

end

