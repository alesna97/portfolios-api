
class Api::V1::TechnologiesController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]
  before_action :set_technology, only: [:show, :update, :destroy]
  
  # GET /api/v1/technologies
  def index
    search = Technology.ransack(params[:q]).result
    technologies = search.order(created_at: :desc).page(params[:page]).per(params[:per_page])

    render json: { data: technologies,  pagination: json_serial(technologies)}
  end

  # GET /api/v1/technologies/1
  def show
    render json: @technology
  end

  # POST /api/v1/technologies
  def create
    @technology = Technology.new(technology_params)

    if @technology.save
      render json: @technology, status: :created
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/technologies/1
  def update
    if @technology.update(technology_params)
      render json: @technology
    else
      render json: @technology.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/technologies/1
  def destroy
    @technology.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_technology
      @technology = Technology.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def technology_params
      params.permit(:name, :image)
    end
end
