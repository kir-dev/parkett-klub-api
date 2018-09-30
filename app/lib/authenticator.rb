class Authenticator
  def initialize(connection = Faraday.new)
    @connection = connection
  end

  def authentication(code)
    access_token_resp = fetch_access_token(code)
    access_token = access_token_resp['access_token']
    user_info_resp = fetch_user_info(access_token)

    {
      name: user_info_resp['displayName'],
      email: user_info_resp['mail'],
      authsch_id: user_info_resp['internal_id']
    }
  end

  private

  def fetch_access_token(code)
    resp = @connection.post ENV['ACCESS_TOKEN_URL'], {
        code: code,
        client_id: ENV['CLIENT_ID'],
        client_secret: ENV['CLIENT_SECRET'],
        grant_type: 'authorization_code'
    }
    raise IOError, 'FETCH_ACCESS_TOKEN' unless resp.success?
    JSON.parse(resp.body)
  end

  def fetch_user_info(access_token)
    resp = @connection.get ENV['USER_INFO_URL'], {
        access_token: access_token
    }
    raise IOError, 'FETCH_USER_INFO' unless resp.success?
    JSON.parse(resp.body)
  end
end
