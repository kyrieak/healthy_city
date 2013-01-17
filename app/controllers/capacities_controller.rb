class CapacitiesController < ApplicationController
  def index
  end

  def show
    @capacity = Capacity.find(params[:id])
  end

  def new
    @capacity = Capacity.new
    @hospitals = Hospital.all
  end

  def create
    @capacity = Capacity.create(params[:capacity])
    if @capacity.save
      redirect_to capacity_path(@capacity), :action => :show
    else
      redirect_to :back
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
