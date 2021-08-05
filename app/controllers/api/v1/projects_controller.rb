class Api::V1::ProjectsController < ApplicationController
  before_action :doorkeeper_authorize!, only: [:create, :update, :destroy]
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /api/v1/projects
  def index
    search = Project.includes(:applications).ransack(params[:q]).result
    projects = search.order(created_at: :desc).page(params[:page]).per(params[:per_page])

    projects_serializer = ActiveModel::Serializer::CollectionSerializer.new(
      projects, serializer: ProjectSerializer
    )

    render json: { data: projects_serializer, pagination: json_serial(projects)}
  end

  # GET /api/v1/projects/1
  def show
    render json: @project, serializer: ProjectSerializer
  end

  # POST /api/v1/projects
  def create
    @project = Project.new(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  def update
    if @project.update(project_params)
      render json: @project
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/projects/1
  def destroy
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.permit(:name, :image, 
                    :description, :url, technology_ids: [],
                    applications_attributes: [:name, :description, :url, :image, :id, :_destroy])
    end
end
