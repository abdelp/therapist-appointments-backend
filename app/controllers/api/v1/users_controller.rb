class API::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  skip_before_action :require_login, only: %i[create index]

  def index
    @users = User.all
    json_response(@users)
  end

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

  def auto_login
    if logged_in_user
      render json: logged_in_user
    else
      render status: 422, json: { errors: 'No User Logged In' }
    end
  end

  def show
    json_response(@user)
  end

  def update
    @user.update(user_params)
    head :no_content
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
