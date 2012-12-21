class Location < ActiveRecord::Base
  attr_accessible :address_1, :address_2, :address_3, :city, :county, :state, :zip_code

  has_many :hospitals

  def self.params_set(loc_attr)
    { :address_1 => loc_attr[0],
  	  :address_2 => loc_attr[1],
  	  :address_3 => loc_attr[2],
  	  :city => loc_attr[3],
  	  :state => loc_attr[4],
      :zip_code => loc_attr[5],
      :county => loc_attr[6]
    }
  end

end
