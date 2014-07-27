class IndexController < ApplicationController
  def index
  @random_card = Card.due.first
    if params[:search] == @random_card.translated_text
      flash[:notice] = "Correct"
      else
        flash[:notice] = "Incorrect"
    end
  end
end
