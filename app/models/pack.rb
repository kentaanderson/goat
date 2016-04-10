class Pack < ActiveRecord::Base
#  belongs_to :event, :class_name => "Pack" 
  belongs_to :event
  # This will not work until pack_id is the FK on pack_items. Currently it is event_id (that choice DID come back to bite...)
  has_many :pack_items, :foreign_key => :pack_id, dependent: :destroy
end
