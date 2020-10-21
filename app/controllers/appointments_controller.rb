class AppointmentsController < ApplicationController
  before_action :set_user
  before_action :set_user_appointment, only: [:show, :update, :destroy]

  def index
    json_response(@user.appointments)
  end

  def show
    json_response(@appointment)
  end

  def create
    @user.appointments.create!(appointment_params)
    json_response(@user, :created)
  end

  def update
    @appointment.update(appointment_params)
    head :no_content
  end

  def destroy
    @appointment.destroy
    head :no_content
  end

  private

  def appointment_params
    params.permit(:user_id, :therapist_id, :start_at, :end_at)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_appointment
    @appointment = @user.appointments.find_by!(id: params[:id]) if @user
  end
end
