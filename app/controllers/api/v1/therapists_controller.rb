class API::V1::TherapistsController < ApplicationController
  before_action :set_therapist, only: %i[show update destroy]
  skip_before_action :require_login, only: %i[index show]

  def index
    @therapists = Therapist
      .all
      .joins('JOIN users u ON u.id = therapists.user_id')
      .select(:id, :user_id, :fullname, :img_url)
    json_response(@therapists)
  end

  def create
    @therapist = Therapist.create!(therapist_params)
    json_response(@therapist, :created)
  end

  def show
    json_response(@therapist)
  end

  def update
    @therapist.update(therapist_params)
    head :no_content
  end

  def destroy
    @therapist.destroy
    head :no_content
  end

  private

  def therapist_params
    params.permit(:user_id)
  end

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end
end
