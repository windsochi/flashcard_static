class IndexController < ApplicationController

  def index
    @random_card = current_user.cards.due.first
  end

end
