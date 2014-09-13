class IndexController < ApplicationController

  def index
    if current_user
      if !current_user.cards.empty?
        @random_card = current_user.due_cards.first
      elsif current_user.decks.empty?
        redirect_to new_deck_path, alert: 'Создайте колоду и добавьте карточки'
      else
        redirect_to decks_path, alert: 'Добавьте карточки в колоду'
      end
    end
  end

  def review
    @random_card = current_user.due_cards.first
    card = current_user.cards.find(params[:card_id])
    @result = card.check_translation(params[:search])
    redirect_to 'index#index'
  end

end
