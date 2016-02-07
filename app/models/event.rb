class Event < ActiveRecord::Base
  has_many :event_attendees, :foreign_key => :event_id
  has_many :users, through: :event_attendees, :class_name => "User"
  
  has_many :packs, as: :packable, dependent: :destroy#, :foreign_key => :event_id
  #has_many :packs, dependent: :destroy, :foreign_key => :event_id
end
