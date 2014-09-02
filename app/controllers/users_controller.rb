class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:new, :create]
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to(cards_path, notice: 'Пользователь создан')
    else
      redirect_to(new_user_path, alert: 'Пользователь не создан')
    end
  end

  def update
    if @user.update(user_params)
      redirect_to(cards_path, notice: 'Пользователь обновлён')
    else
      redirect_to(edit_user_path, alert: 'Пользователь не обновлён')
    end
  end

  private
    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

end
