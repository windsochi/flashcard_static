class IndexController < ApplicationController

  def index
    @random_card = Card.due(Time.now, current_user.id).first
  end

end
