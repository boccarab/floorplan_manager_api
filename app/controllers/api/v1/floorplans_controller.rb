class Api::V1::FloorplansController < ApplicationController
  before_action :set_floorplan, only: [:show, :update, :destroy]

  # GET /api/v1/floorplans
  def index
    @floorplans = Floorplan.all

    if params[:project_id]
      @floorplans = @floorplans.where(project_id: params[:project_id])
    end

    render json: @floorplans
  end

  # GET /api/v1/floorplans/1
  def show
    render json: @floorplan
  end

  # POST /api/v1/floorplans
  def create
    project = Project.find(params.require(:floorplan).require(:project_id))
    @floorplan = project.floorplans.new(create_floorplan_params)

    if @floorplan.save
      render json: @floorplan, status: :created
    else
      render json: @floorplan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/floorplans/1
  def update
    if @floorplan.update(update_floorplan_params)
      render json: @floorplan
    else
      render json: @floorplan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/floorplans/1
  def destroy
    @floorplan.destroy
  end

  private

  def set_floorplan
    @floorplan = Floorplan.find(params[:id])
  end

  def create_floorplan_params
    params.require(:floorplan).permit(:name, :project_id, :plan_image)
  end

  def update_floorplan_params
    params.require(:floorplan).permit(:name, :plan_image)
  end
end
