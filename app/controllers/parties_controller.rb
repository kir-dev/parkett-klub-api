class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :update, :destroy]
  before_action :check_references, only: [:destroy]

  # GET /parties
  def index
    @parties = Party.all

    render json: @parties
  end

  # GET /parties/1
  def show
  end

  # POST /parties
  def create
    @party = Party.new(party_params)
    set_djs

    if @party.save
      render json: @party, status: :created, location: @party
    else
      render json: @party.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parties/1
  def update
    set_djs
    if @party.update(party_params)
      render json: @party
    else
      render json: @party.errors, status: :unprocessable_entity
    end
  end

  # DELETE /parties/1
  def destroy
    @party.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_party
    @party = Party.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def party_params
    params.permit(
      :title,
      :photo,
      :start_date,
      :end_date,
      :program,
      :content,
      :facebook_event,
      :application_form,
      :spot,
      :bss,
      :bss_cover,
      :spot_cover,
      :dance_course_id,
      dj_ids: []
    )
  end

  def check_references
    set_party
    render_locked_error(@party) unless @party.workshop.count.zero?
  end

  def set_djs
    return unless params[:dj_ids]

    @party.djs = Dj.where(id: params[:dj_ids])
  end
end
