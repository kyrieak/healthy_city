class CompletionsController < ApplicationController
  def index
  end

  def new
    id = params[:a_id].delete("a_icon_").to_i
    user = Activity.find(id).user
    @completion = Completion.new(:activity_id => id, :date => Date.today)
    @activity_options = user.progress([Date.today])[Date.today][:not_done]
  end

  def create
    @completion = Completion.create!(params[:completion])
    redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
