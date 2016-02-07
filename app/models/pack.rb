class Pack < ActiveRecord::Base
 # belongs_to :user, :class_name => "Pack" 

#  belongs_to :event, :class_name => "Pack" 

  belongs_to :packable, polymorphic: true
#  belongs_to :event, polymorphic: true
end
