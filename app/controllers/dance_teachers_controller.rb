class DanceTeachersController < ApplicationController
  before_action :set_dance_teacher, only: [:show, :update, :destroy]

  # GET /dance_teachers
  def index
    @dance_teachers = DanceTeacher.all

    render json: @dance_teachers
  end

  # GET /dance_teachers/1
  def show
    render json: @dance_teacher
  end

  # POST /dance_teachers
  def create
    @dance_teacher = DanceTeacher.new(dance_teacher_params)

    if @dance_teacher.save
      render json: @dance_teacher, status: :created, location: @dance_teacher
    else
      render json: @dance_teacher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_teachers/1
  def update
    if @dance_teacher.update(dance_teacher_params)
      render json: @dance_teacher
    else
      render json: @dance_teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dance_teachers/1
  def destroy
    @dance_teacher.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dance_teacher
      @dance_teacher = DanceTeacher.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dance_teacher_params
      params.require(:dance_teacher).permit(:name, :url)
    end
end
