class ReviewsController < ApplicationController

  def create
    @card = current_user.cards.find(params[:card_id])
    @result = @card.check_translation(params[:search])
    redirect_to root_path
  end

end
