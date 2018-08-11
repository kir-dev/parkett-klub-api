class PartiesController < ApplicationController
  before_action :set_party, only: [:show, :update, :destroy]

  # GET /parties
  def index
    @parties = Party.all

    render json: @parties
  end

  # GET /parties/1
  def show
    render json: @party
  end

  # POST /parties
  def create
    @party = Party.new(party_params)

    if @party.save
      render json: @party, status: :created, location: @party
    else
      render json: @party.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /parties/1
  def update
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
      params.require(:party).permit(:title)
    end
end
