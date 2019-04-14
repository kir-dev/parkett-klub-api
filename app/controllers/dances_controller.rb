class DancesController < ApplicationController
  before_action :set_dance, only: [:show, :update, :destroy]
  before_action :check_references, only: [:destroy]

  # GET /dances
  def index
    @dances = Dance.all
  end

  # GET /dances/1
  def show
  end

  # POST /dances
  def create
    @dance = Dance.new(dance_params)

    if @dance.save
      render json: @dance, status: :created, location: @dance
    else
      render json: @dance.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dances/1
  def update
    if @dance.update(dance_params)
      render json: @dance
    else
      render json: @dance.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dances/1
  def destroy
    @dance.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dance
    @dance = Dance.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def dance_params
    params.require(:dance).permit(:name, :content, :dance_type_id)
  end

  def check_references
    set_dance
    render_locked_error(@dance) unless @dance.workshop.count.zero? && @dance.dance_course.count.zero?
  end
end
