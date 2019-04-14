class ApplicationController < ActionController::API

  def current_user
    token = params[:token]
    return nil if token.nil?
    payload = TokiToki.decode(token)
    @current_user ||= User.find_by(authsch_id: payload[0]['sub'])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user!
    head :unauthorized unless logged_in?
  end

  def render_locked_error(model)
    render json: model.errors, status: :locked
  end
end
