class HospitalsController < ApplicationController
  def index
  	@hospitals = Hospital.all.group_by { |h| h.location.state }
    @table_headers = Hospital.t_headers
  end

  def show
    @hospital = Hospital.find(params[:id])
  end
end
