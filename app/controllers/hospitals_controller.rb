class HospitalsController < ApplicationController
  def index
  	@hospitals = Hospital.all.group_by { |h| h.location.state }
  end
end
