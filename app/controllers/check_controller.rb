class CheckController < ApplicationController
  def index
    @random_card = Card.due.first
    if params[:search] == @random_card.translated_text
      @random_card.review_date + 2.days
      @random_card.save
      redirect_to root_path
      flash[:notice] = "Correct ..."
    else
      redirect_to root_path
      flash[:notice] = "Incorrect ..."
    end
end
