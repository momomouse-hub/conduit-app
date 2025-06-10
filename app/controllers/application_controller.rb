class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_user, :logged_in?

  # def current_user
  #   @current_user ||= User.find_by(id: session[:user_id])
  # end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]).tap do |u|
      Rails.logger.debug "⭐ current_user = #{u.inspect}"
    end
  end

  def logged_in?
    current_user.present?
  end

  def authenticate_user!
    redirect_to signin_path, alert: "ログインが必要です" unless logged_in?
  end
end
