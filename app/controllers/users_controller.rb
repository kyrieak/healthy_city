class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @progress = @user.progress(days_of_week(Date.today))
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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def days_of_week(date)
    day = date
    week = []

    until (day.sunday? && (week.length > 0))
      week << day
      day = day.prev_day
    end

    day = date.next
    week.reverse!

    until (day.monday? && (week.length == 7))
      week << day
      day = day.next
    end
    week
  end

end
