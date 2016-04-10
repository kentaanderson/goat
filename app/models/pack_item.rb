class PackItem < ActiveRecord::Base
#  belongs_to :user through :pack?
#  belongs_to :event through :pack?
  belongs_to :pack
end
