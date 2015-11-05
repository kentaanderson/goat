class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :confirmable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
end
