class CheckController < ApplicationController
  def index
    @random_card = Card.due.first
    @search = params[:search]
  end
end
