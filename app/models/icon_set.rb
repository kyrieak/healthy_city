class IconSet < ActiveRecord::Base
  attr_accessible :user_id, :icon_id, :selected, :action_name

  belongs_to :user
  has_many :icons
end