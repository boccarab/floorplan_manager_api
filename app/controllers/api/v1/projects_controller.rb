class Api::V1::ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :update, :destroy]

  # GET /api/v1/projects
  def index
    @projects = Project.all

    if params[:user_id]
      @projects = @projects.where(user_id: params[:user_id])
    end

    render json: @projects
  end

  # GET /api/v1/projects/1
  def show
    render json: @project
  end

  # POST /api/v1/projects
  def create
    user = User.find(params.require(:project).require(:user_id))
    @project = user.projects.new(create_project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/projects/1
  def update
    if @project.update(update_project_params)
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

  def set_project
    @project = Project.find(params[:id])
  end

  def create_project_params
    params.require(:project).permit(:name, :user_id)
  end

  def update_project_params
    params.require(:project).permit(:name)
  end
end
