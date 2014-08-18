class ApplicationController < ActionController::Base
  before_filter :require_login
  protect_from_forgery with: :exception

  private
  def not_authenticated
    redirect_to login_path, alert: "Пожалуйста войдите"
  end

end
