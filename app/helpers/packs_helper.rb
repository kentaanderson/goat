module PacksHelper
	def pack_name_event(event_id)
	  pack_where = Pack.where("event_id" => event_id, "user_id" => current_user.id)# lookup pack_id 

	  if pack_where.exists? then													# This is where the @pack is created/accessed
	  	Pack.find(pack_where.first.id).name
	  else
	  	"n/a"
	  end
	end
end
