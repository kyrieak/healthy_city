class CompletionsController < ApplicationController
  def index
  end

  def new
    @completion = Completion.new
  end

  def create
    @completion = Completion.create!(params[:completion])
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
