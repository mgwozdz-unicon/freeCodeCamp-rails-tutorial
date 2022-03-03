class RostersController < ApplicationController
  before_action :set_roster, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: []
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  # GET /rosters or /rosters.json
  def index
    if Roster.exists?(:user_id => current_user.id)
      @rosters = Roster.where(user_id: current_user.id).map(&:attributes)
    else
      @rosters = []
    end
  end

  # GET /rosters/1 or /rosters/1.json
  def show
    if @roster == nil
      redirect_to rosters_path
    end
  end

  # GET /rosters/new
  def new
    # @roster = Roster.new
    @roster = current_user.rosters.build
  end

  # GET /rosters/1/edit
  def edit
    if @roster == nil
      redirect_to rosters_path
    end
  end

  # POST /rosters or /rosters.json
  def create
    # @roster = Roster.new(roster_params)
    @roster = current_user.rosters.build(roster_params)

    respond_to do |format|
      if @roster.save
        format.html { redirect_to roster_url(@roster), notice: "Roster was successfully created." }
        format.json { render :show, status: :created, location: @roster }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rosters/1 or /rosters/1.json
  def update
    respond_to do |format|
      if @roster.update(roster_params)
        format.html { redirect_to roster_url(@roster), notice: "Roster was successfully updated." }
        format.json { render :show, status: :ok, location: @roster }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rosters/1 or /rosters/1.json
  def destroy
    @roster.destroy

    respond_to do |format|
      format.html { redirect_to rosters_url, notice: "Roster was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    if Roster.exists?(params[:id])
      @roster = current_user.rosters.find_by(id: params[:id])
      redirect_to rosters_path, notice: "Not Authorized to Edit This Roster" if @roster.nil?
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster
      if Roster.exists?(params[:id])
        @roster = Roster.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def roster_params
      params.require(:roster).permit(:first_name, :last_name, :email, :phone, :user_id, :id)
    end
end
