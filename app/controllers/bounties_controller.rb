class BountiesController < ApplicationController
  before_action :set_bounty, only: [:show, :edit, :update, :destroy]

  # GET /bounties
  # GET /bounties.json
  def index
    @bounties = Bounty.all
  end

  # GET /bounties/1
  # GET /bounties/1.json
  def show
  end

  # GET /bounties/new
  def new
    @bounty = Bounty.new
  end

  # GET /bounties/1/edit
  def edit
  end

  # POST /bounties
  # POST /bounties.json
  def create
    @bounty = Bounty.new(bounty_params)

    respond_to do |format|
      if @bounty.save
        format.html { redirect_to @bounty, notice: 'Bounty was successfully created.' }
        format.json { render :show, status: :created, location: @bounty }
      else
        format.html { render :new }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bounties/1
  # PATCH/PUT /bounties/1.json
  def update
    respond_to do |format|
      if @bounty.update(bounty_params)
        format.html { redirect_to @bounty, notice: 'Bounty was successfully updated.' }
        format.json { render :show, status: :ok, location: @bounty }
      else
        format.html { render :edit }
        format.json { render json: @bounty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bounties/1
  # DELETE /bounties/1.json
  def destroy
    @bounty.destroy
    respond_to do |format|
      format.html { redirect_to bounties_url, notice: 'Bounty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bounty
      @bounty = Bounty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bounty_params
      params.require(:bounty).permit(:event_id, :value, :name, :user_id)
    end
end
