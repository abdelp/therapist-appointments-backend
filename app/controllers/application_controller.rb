class ApplicationController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :require_login, except: :login

  def encode_token(payload)
    JWT.encode(payload, 's3cr3t')
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    return unless auth_header

    token = auth_header.split(' ')[1]
    begin
      JWT.decode(token, 's3cr3t', true, algorithm: 'HS256')
    rescue JWT::DecodeError
      nil
    end
  end

  def logged_in_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @user = User.find(user_id)
  end

  def logged_in?
    !logged_in_user.nil?
  end

  def require_login
    render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
  end
end
