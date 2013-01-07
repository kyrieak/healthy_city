class Icon < ActiveRecord::Base
  attr_accessible :filename
  
  has_many :activities
end
