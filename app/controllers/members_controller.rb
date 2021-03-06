class MembersController < ApplicationController
  before_action :set_member, only: [:show, :update, :destroy]
  before_action :check_references, only: [:destroy]

  # GET /members
  def index
    @members = Member.order(:name)

    render json: @members
  end

  # GET /members/1
  def show
    render json: @member
  end

  # POST /members
  def create
    @member = Member.new(member_params)

    if @member.save
      render json: @member, status: :created, location: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      render json: @member
    else
      render json: @member.errors, status: :unprocessable_entity
    end
  end

  # DELETE /members/1
  def destroy
    @member.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_member
    @member = Member.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def member_params
    params.require(:member).permit(:name, :email, :position, :description, :image)
  end

  def check_references
    render_locked_error(@member) unless @member.user.count.zero?
  end
end
