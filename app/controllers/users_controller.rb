class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[create login]

  def create
    @user = User.create!(user_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }
    else
      render status: 422, json: { error: 'Invalid username or password' }
    end
  end

  def login
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token, sucess: "Welcome back, #{@user.username}" }
    else
      render status: 422, json: { error: 'Invalid username or password' }
    end
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
