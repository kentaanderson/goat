class Pack < ActiveRecord::Base
#  belongs_to :event, :class_name => "Pack" 
  belongs_to :event
  has_many :pack_items, :foreign_key => :pack_id, dependent: :destroy
end
