class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  
  def edit
    @card = Card.find(params[:id])
  end
  
  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end
end
