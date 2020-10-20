class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  
  def index
    @users = User.all
    json_response(@users)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
