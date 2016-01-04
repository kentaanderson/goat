class Pack < ActiveRecord::Base
  # this could likely be deleted soon
  belongs_to :user
  belongs_to :event

end
