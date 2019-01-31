class DjsController < ApplicationController
  before_action :set_dj, only: %i[show update destroy]
  before_action :require_admin, except: %i[index show]

  # GET /djs
  def index
    @djs = Dj.all

    render json: @djs
  end

  # GET /djs/1
  def show
    render json: @dj
  end

  # POST /djs
  def create
    @dj = Dj.new(dj_params)

    if @dj.save
      render json: @dj, status: :created, location: @dj
    else
      render json: @dj.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /djs/1
  def update
    if @dj.update(dj_params)
      render json: @dj
    else
      render json: @dj.errors, status: :unprocessable_entity
    end
  end

  # DELETE /djs/1
  def destroy
    @dj.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dj
      @dj = Dj.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def dj_params
      params.require(:dj).permit(:name, :content)
    end
end
