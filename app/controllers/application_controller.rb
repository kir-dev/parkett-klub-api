class ApplicationController < ActionController::API

  def current_user
    token = params[:token]
    payload = TokiToki.decode(token)
    @current_user ||= User.find_by(authsch_id: payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end

  def require_admin
    head :forbidden unless current_user&.admin?
  end
end
