
class Api::V1::TechnologiesController < ApplicationController
  before_action :set_api_v1_technology, only: [:show, :update, :destroy]
  # before_action -> { doorkeeper_authorize! :read }, only: :index
  # before_action only: [:create, :update, :destroy] do
  #   doorkeeper_authorize! :write
  # end

  # GET /api/v1/technologies
  def index
    @api_v1_technologies = Technology.all

    render json: @api_v1_technologies
  end

  # GET /api/v1/technologies/1
  def show
    render json: @api_v1_technology
  end

  # POST /api/v1/technologies
  def create
    @api_v1_technology = Technology.new(api_v1_technology_params)

    if @api_v1_technology.save
      render json: @api_v1_technology, status: :created, location: @api_v1_technology
    else
      render json: @api_v1_technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/technologies/1
  def update
    if @api_v1_technology.update(api_v1_technology_params)
      render json: @api_v1_technology
    else
      render json: @api_v1_technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/technologies/1
  def destroy
    @api_v1_technology.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_technology
      @api_v1_technology = Technology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_v1_technology_params
      params.permit(:name, :image)
    end
end
