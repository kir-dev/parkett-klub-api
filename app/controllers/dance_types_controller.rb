class DanceTypesController < ApplicationController
  before_action :set_dance_type, only: [:show, :update, :destroy]
  before_action :check_references, only: [:destroy]

  # GET /dance_types
  def index
    @dance_types = DanceType.all

    render json: @dance_types
  end

  # GET /dance_types/1
  def show
    render json: @dance_type
  end

  # POST /dance_types
  def create
    @dance_type = DanceType.new(dance_type_params)

    if @dance_type.save
      render json: @dance_type, status: :created, location: @dance_type
    else
      render json: @dance_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_types/1
  def update
    if @dance_type.update(dance_type_params)
      render json: @dance_type
    else
      render json: @dance_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dance_types/1
  def destroy
    @dance_type.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dance_type
    @dance_type = DanceType.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def dance_type_params
    params.require(:dance_type).permit(:name, :color, :image)
  end

  def check_references
    set_dance_type
    render_locked_error(@dance_type) unless @dance_type.dance.count.zero?
  end
end
