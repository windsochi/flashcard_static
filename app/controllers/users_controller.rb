class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to(users_path, notice: 'Пользователь создан')
      else
        render 'new'
      end
  end

  def update
      if @user.update(user_params)
        redirect_to(users_path, notice: 'Пользователь обновлён.')
      else
        render 'edit'
      end
  end

  def destroy
    @user.destroy
    redirect_to users_path
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
