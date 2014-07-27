class IndexController < ApplicationController
  def index
    @random_card = Card.due.first
  end
end
