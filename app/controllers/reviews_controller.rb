class ReviewsController < ApplicationController
  def index
    sleep 2
    card = Card.find(params[:card_id])
    if card.check_translation(params[:search])
      flash[:success] = "Correct!"
      card.create_card
    else
      flash[:error] = "Incorrect!"
    end
    redirect_to root_path
  end
end