class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @activities = @user.activities
    @completions = @user.completions_for_week(Date.today)
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
