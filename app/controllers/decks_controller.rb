class DecksController < ApplicationController
  respond_to :html, :js
  before_action :find_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = current_user.decks
  end

  def show
    redirect_to deck_cards_path(@deck)
  end

  def new
    @deck = current_user.decks.new
  end

  def create
    @deck = current_user.decks.create(deck_params)
    @decks = current_user.decks
  end

  def edit
  end

  def update
    @deck.update(deck_params)
    @decks = current_user.decks
  end

  def destroy
    @deck.destroy
    @decks = current_user.decks
  end

  private

  def deck_params
    params.require(:deck).permit(:title)
  end

  def find_deck
    @deck = current_user.decks.find(params[:id])
  end

end

