class ActivitiesController < ApplicationController
  def index
    @activities = User.find(params[:user_id]).activities
  end

  def show
    @activity = Activity.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = params[:id]
    @activity = Activity.new
    @icon_options = Icon.options
  end

  def create
    @user = User.find(params[:user_id])
    @activity = @user.activities.build(params[:activity])
    if @activity.user
      puts "Activity: #{@activity.inspect}"
      puts "User: #{@user.inspect}"
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @activity = Activity.find(params[:id])
    @icons = Icon.all
    respond_to do |format|
      format.html
    end
  end

  def update
    @activity = Activity.update_attributes(params[:id])
  end

  def destroy
  end
end
