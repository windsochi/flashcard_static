class ReviewsController < ApplicationController

  def create
    card = current_user.cards.find(params[:card_id])
    if card.check_translation(params[:search])
      case card.check_translation(params[:search])
      when :zero_error
        flash[:success] = "Верно!"
        card.update_review_date
      when :one_error
        flash[:error] = "Неверно!"
        flash[:notice] = "1 ошибка"
      when :two_error
        flash[:error] = "Неверно!"
        flash[:notice] = "2 ошибки"
      when :three_error
        flash[:error] = "Неверно!"
        flash[:notice] = "3 ошибки"
      when :more_error
        flash[:error] = "Неверно!"
        flash[:notice] = "Много ошибок. Займитесь другим делом"
      end
    end
    redirect_to root_path
  end

end
