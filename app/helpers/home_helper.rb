module HomeHelper

	def pack_user(user_id)
		dbag = User.find(user_id)
		bag = dbag.first_name.first.to_s + ". " + dbag.last_name.to_s
	end
end
