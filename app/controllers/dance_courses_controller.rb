class DanceCoursesController < ApplicationController
  before_action :set_dance_course, only: [:show, :update, :destroy]

  # GET /dance_courses
  def index
    @dance_courses = DanceCourse.all

    render json: @dance_courses
  end

  # GET /dance_courses/1
  def show
    render json: @dance_course
  end

  # POST /dance_courses
  def create
    @dance_course = DanceCourse.new(dance_course_params)

    if @dance_course.save
      render json: @dance_course, status: :created, location: @dance_course
    else
      render json: @dance_course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /dance_courses/1
  def update
    if @dance_course.update(dance_course_params)
      render json: @dance_course
    else
      render json: @dance_course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /dance_courses/1
  def destroy
    @dance_course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dance_course
      @dance_course = DanceCourse.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dance_course_params
      params.require(:dance_course).permit(
        :dance_teacher_id,
        :dance_id,
        :level,
        :length)
    end
end
