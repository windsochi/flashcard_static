class ReviewsController < ApplicationController

  def create
    card = current_user.cards.find(params[:card_id])
    if card.check_translation(params[:search])
      flash[:success] = "Верно!"
      card.update_review_date
    else
      flash[:error] = "Неверно!"
    end
    redirect_to root_path
  end

end
