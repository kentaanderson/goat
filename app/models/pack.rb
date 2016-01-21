class Pack < ActiveRecord::Base
  belongs_to :user, :class_name => "Pack" 
  belongs_to :event, :class_name => "Pack" 
end
