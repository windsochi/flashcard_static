class UserSessionsController < ApplicationController
  skip_before_filter :require_login, except: [:destroy]

  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_to(cards_path, notice: 'Вход выполнен')
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
