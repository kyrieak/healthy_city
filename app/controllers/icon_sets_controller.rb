class IconSetsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @icons = Icon.all
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.find(params[:id])
    @icon_set = @user.icon_set.build(params[:icon_set])
    if @icon_set.save
      render :show
    else
      flash[:error] = "it didn't save"
    end
  end

  def show
    @icon_set = User.find(params[:id]).icon_set
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private
  
  def nothing
  end

end
