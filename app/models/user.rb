class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  has_many :gears, dependent: :destroy # each gear item is owned by only one user. deleting the user also deletes all their gear
# MAKING PACK BELONG_TO EVENT ONLY  has_many :packs, as: :packable, dependent: :destroy #, :foreign_key => :user_id

  has_many :event_attendees, :foreign_key => :user_id, dependent: :destroy
  has_many :events, through: :event_attendees, :class_name => "Event"
end
