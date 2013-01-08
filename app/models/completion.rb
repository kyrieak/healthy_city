class Completion < ActiveRecord::Base
  attr_accessible :activity_id, :date

  belongs_to :activity

end
