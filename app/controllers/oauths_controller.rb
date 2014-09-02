class OauthsController < ApplicationController
  skip_before_filter :require_login

  def oauth
    login_at(params[:provider])
  end

  def callback
    provider = params[:provider]
    if @user = login_from(provider)
      redirect_to root_path, notice: "Вы вошли с помощью #{provider.titleize}!"
    else
      begin
        @user = create_from(oauth_params)
        reset_session
        auto_login(@user)
        redirect_to root_path, notice: "Вы вошли с помощью #{provider.titleize}!"
      rescue
        redirect_to root_path, alert: "Не удалось войти с помощью #{provider.titleize}!"
      end
    end
  end

  private
    def oauth_params
      params.require(:authentication).permit(:user_id, :provider, :uid)
    end

end
