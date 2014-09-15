class ReviewsController < ApplicationController

  def create
    card = current_user.cards.find(params[:card_id])
    ResultService.new(card.check_translation(params[:search]))
    redirect_to root_path
  end

end
