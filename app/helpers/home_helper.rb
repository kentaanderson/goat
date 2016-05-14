module HomeHelper

	def pack_user(user_id)
		dbag = User.find(user_id)
		bag = dbag.first_name.first.to_s + ". " + dbag.last_name.to_s
	end

	def trip_length(event_id)
		trip = Event.find(event_id)
		if trip.start_date.is_a?(Date) and trip.return_date.is_a?(Date) then
			trip_days = (trip.return_date - trip.start_date).to_i 
		else
			1
		end
	end

  def oz_day(pack_id)

	pack = Pack.find(pack_id)
  	total_pack_weight_oz(pack_id).to_i / trip_length(pack.event_id).to_i

  end

  def total_pack_weight_oz(pack_id)
    # this requires event_id and user_id because I can't figure out how to use pack_id in this instance. It's not adequately tied back to pack_items yet
    # used this query format because apparently you can't retrieve NULL values without explicitly asking for them
	pack = Pack.find(pack_id)
	event = Event.find(pack.event_id)
    pack_items = PackItem.where("event_id = ? AND (wearing != 1) AND (delivery != 1) AND user_id = ?", pack.event_id, pack.user_id)
    total_weight = 0
    total_weight_oz = 0

    if pack_items.length > 0 then
      pack_items.each do |item|
        if item.weight_oz then
          total_weight_oz += item.weight_oz.to_d
        end
      end
      total_weight = total_weight_oz
    else
      0
    end
  end

#class AmazonSync
 # def test
 #   @request = Vacuum.new
 #   @request.configure(
 #       aws_access_key_id: "AKIAJIPQJQ6K36TYPVGA",
 #       aws_secret_access_key: "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",
 #       associate_tag: "geargoat-20"
 #   )
 
 #   puts "im working!"
 #   response = @request.item_lookup(
 #     query: {
 #       'ItemId' => 'B00GSNFG84',
 #       'ResponseGroup' => 'Large'
 #     }
 #   )
 #   puts "Parsing response.."
 
 #   response = response.to_h
 
#    puts "*** Item title ***\n"
#    print response['ItemLookupResponse']['Items']['Item']['ItemAttributes']['Title']
#    puts "\n*** Item image url ***"
#    print response['ItemLookupResponse']['Items']['Item']['LargeImage']['URL']
#    puts "\n*** Item price ***"
#    print response['ItemLookupResponse']['Items']['Item']['ItemAttributes']['ListPrice']['FormattedPrice'].tr('$', '')
#    puts "\n*** Item description ***"
#    print response['ItemLookupResponse']['Items']['Item']['EditorialReviews']['EditorialReview']['Source']
#    puts "\n\n ---"
#    print response['ItemLookupResponse']['Items']['Item']['EditorialReviews']['EditorialReview']['Content']
#  end

end
