class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  def edit
    @card = Card.find(params[:id])
  end
end
