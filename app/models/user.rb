class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  has_many :gears, dependent: :destroy # each gear item is owned by only one user. deleting the user also deletes all their gear
  has_many :packs, dependent: :destroy
  has_many :events
end
