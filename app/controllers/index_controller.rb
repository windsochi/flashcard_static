class IndexController < ApplicationController
  def index
    @card = Card.where("review_date <= ?", Time.now).limit(1)

    otvet = params[:search]
  
    if otvet  == 1
      flash[:notice] = "Verno"
    else
      flash[:notice] = "Neverno"
    end

  end
end
