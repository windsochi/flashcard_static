class CheckController < ApplicationController
  def index
    random_card = Card.due.first
    if params[:search] == random_card.translated_text
      flash[:notice] = "Correct"
      redirect_to root_path
      else
        flash[:notice] = "Incorrect"
        redirect_to root_path
    end
  end
end
