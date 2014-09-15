class ReviewsController < ApplicationController

  def create
    card = current_user.cards.find(params[:card_id])
    @result = card.check_translation(params[:search])
    if @result[:number_of_errors] == 0
      flash[@result[:status]] = "Верно."
    else
      flash[@result[:status]] = "В слове найдено ошибок: #{@result[:number_of_errors]}."
    end
    redirect_to root_path
  end

end
