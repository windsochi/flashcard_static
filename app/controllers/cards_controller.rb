class CardsController < ApplicationController
  def index
    @cards = Card.all
  end
  def edit
  end
end
