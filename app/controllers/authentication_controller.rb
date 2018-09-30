
class AuthenticationController < ApplicationController
  def authsch
    authenticator = Authenticator.new
    user_info = authenticator.authentication(params[:code])

    # Generate token
    token = TokiToki.encode(user_info[:authsch_id])

    # create user if it doesn't exist
    User.where(authsch_id: user_info[:authsch_id]).first_or_create!(
        user_info
    )

    redirect_to "#{ENV['CLIENT_URL']}?token=#{token}"
  rescue StandardError => error
    redirect_to "#{ENV['CLIENT_URL']}?error=#{error.message}"
  end
end
