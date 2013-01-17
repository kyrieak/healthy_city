class Hospital < ActiveRecord::Base

  attr_accessible :emergency_services, :hospital_ownership, :hospital_type, :location_id, :name, :phone_number, :provider_number

  belongs_to :location
  has_one :capacity

  def self.row_to_params(row)
  	{
      :provider_number => row[0],
      :name => row[1],
      :phone_number => row[9],
      :hospital_type => row[10],
      :hospital_ownership => row[11],
      :emergency_services => row[12]
    }
  end

  def self.t_headers
    [
      "Name",
      "City",
      "Provider\#",
      "Phone",
      "Type",
      "Ownership",
      "Emergency Services"
    ]
  end
end
