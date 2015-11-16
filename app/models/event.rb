class Event < ActiveRecord::Base
  belongs_to :user
  has_many :packs, foreign_key: "event_id"



  def title_dates
  	  "#{title} (#{start_date})"
  end
end
