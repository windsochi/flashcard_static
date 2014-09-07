class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    User.new
  end

  def create
    if login(params[:email], params[:password])
      redirect_to(decks_path, notice: 'Вход выполнен')
    else
      flash.now[:alert] = 'Вход не выполнен'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path
  end

end
