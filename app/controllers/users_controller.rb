class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @progress = @user.progress(Date.today)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.create!(params[:user])
    redirect_to new_user_activities_path(:user_id => @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
