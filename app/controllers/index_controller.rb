class IndexController < ApplicationController
  def index
  if params[:search] == Card.first_card[:original_text] 
      flash[:notice] = "Verno"
      else
        flash[:notice] = "Neverno"
    end
  end
end
