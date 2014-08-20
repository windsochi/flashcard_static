class ReviewsController < ApplicationController

  def create
    card = current_user.cards.find(params[:card_id])
    if card.check_translation(params[:search])
      flash[:success] = "Correct!"
      card.update_review_date
    else
      flash[:error] = "Incorrect!"
    end
    redirect_to root_path
  end

end
