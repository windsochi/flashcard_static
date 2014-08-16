class UsersController < ApplicationController
  skip_before_filter :require_login, only: [:index, :new, :create]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = Users.all
  end

  def show
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        redirect_to(:users, notice: 'Пользователь был успешно создан.')
        format.html {redirect_to @user, notice: 'Пользователь был успешно создан.'}
        format.json {render action: 'show', status: :created, location: @user}
      else
        format.html{render action: 'new'}
        format.json{render json: @user.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{redirect_to @user, notice: 'Пользователь был успешно обновлён.'}
        format.json{head :no_content}
      else
        format.html{render action: 'edit'}
        format.json{render json: @user.errors, status: unprocessable_entity}
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html{redirect_to users_url}
      format.json{head :no_content}
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
