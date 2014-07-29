class CheckController < ApplicationController
  def index
    card = Card.find(params[:check_id_card])
    if card.check_translation(params[:search])
      flash[:success] = "Correct!"
      card.update_attributes(review_date: Time.now+3.days)
    else
      flash[:error] = "Incorrect!"
    end
    redirect_to root_path
  end
end
