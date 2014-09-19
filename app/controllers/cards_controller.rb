class CardsController < ApplicationController
  respond_to :html, :js
  before_action :find_card, only: [:show, :edit, :update, :destroy]
  before_action :find_deck, only: [:index, :new, :create]

  def index
    @cards = @deck.cards
  end

  def new
    @card = @deck.cards.new
  end

  def create
    @card = @deck.cards.create(card_params.merge(user: current_user))
    @cards = @deck.cards
  end

  def show
  end

  def edit
  end

  def update
    @card.update(card_params)
    current_deck = @card.deck_id
    @deck = current_user.decks.find(current_deck)
    @cards = @deck.cards
  end

  def destroy
    @card.destroy
    redirect_to deck_cards_path(@card.deck_id), notice: 'Карточка удалена'
  end

  private

  def card_params
    params.require(:card).permit(:review_date, :original_text, :translated_text, :user_id, :picture, :remove_picture)
  end

  def find_card
    @card = current_user.cards.find(params[:id])
  end

  def find_deck
    @deck = current_user.decks.find(params[:deck_id])
  end

end
