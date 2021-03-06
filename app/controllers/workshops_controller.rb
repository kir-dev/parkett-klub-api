class WorkshopsController < ApplicationController
  before_action :set_workshop, only: [:show, :update, :destroy]

  # GET /workshops
  def index
    @workshops = Workshop.all

    render json: @workshops
  end

  # GET /workshops/1
  def show
    render json: @workshop
  end

  # POST /workshops
  def create
    @workshop = Workshop.new(workshop_params)

    if @workshop.save
      render json: @workshop, status: :created, location: @workshop
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /workshops/1
  def update
    if @workshop.update(workshop_params)
      render json: @workshop
    else
      render json: @workshop.errors, status: :unprocessable_entity
    end
  end

  # DELETE /workshops/1
  def destroy
    @workshop.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_workshop
      @workshop = Workshop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def workshop_params
      params.require(:workshop).permit(
        :title,
        :photo,
        :start_date,
        :end_date,
        :program,
        :content,
        :theme,
        :facebook_event,
        :application_form,
        :party_id,
        :dance_id,
        :dance_teacher_id,
        :dance_type_id
      )
    end
end
