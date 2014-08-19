class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.new(card_params)
    if @card.save
      redirect_to cards_path
      flash[:notice] = 'Карточка успешно создана'
    else
      render 'new'
      flash[:alert] = 'Карточка не создана'
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
    redirect_to(cards_path, notice: 'Карточка удалена')
  end

  private
    def card_params
      params.require(:card).permit(:review_date, :original_text, :translated_text, :user_id)
    end

    def find_card
      @card = current_user.cards.find(params[:id])
    end

end
