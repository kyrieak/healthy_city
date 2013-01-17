class Capacity < ActiveRecord::Base
  attr_accessible :bed_count, :full_time_nurse_count, :hospital_id, :teaching_hospital, :source

  belongs_to :hospital
end
