class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_client
  
  def current_client
    @current_client ||= Client.find(session[:client_id]) if session[:client_id]
  end

  # def authorize
  #   redirect_to login_path, alert: "You must be logged in!" unless current_client.present?
  # end
end
