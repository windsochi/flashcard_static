class IndexController < ApplicationController

  def index
    if current_user
      if !current_user.cards.empty?
        @random_card = current_user.due_cards.first
      elsif current_user.decks.empty?
        redirect_to :new_deck, alert: 'Создайте колоду и добавьте карточки'
      else
        redirect_to :decks, alert: 'Добавьте карточки в колоду'
      end
    end
  end

end
