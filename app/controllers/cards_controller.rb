class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to cards_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @card.update(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end
end

private
  def card_params
    params.require(:card).permit(:review_date, :original_text, :translated_text)
  end

  def find_card
    @card = Card.find(params[:id])
  end
