class DecksController < ApplicationController
  before_action :find_deck, only: [:show, :edit, :update, :destroy]

  def index
    @decks = current_user.decks
  end

  def show
    redirect_to deck_cards_path(@deck)
  end

  def new
    @deck = current_user.decks.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @deck = current_user.decks.create(deck_params)
    if @deck.save
      redirect_to decks_path, notice: 'Колода успешно создана'
    else
      flash[:alert] = 'Колода не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @deck.update(deck_params)
      redirect_to decks_path, notice: 'Колода успещно обновлена'
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path, notice: 'Колода удалена'
  end

  private

  def deck_params
    params.require(:deck).permit(:title)
  end

  def find_deck
    @deck = current_user.decks.find(params[:id])
  end

end

