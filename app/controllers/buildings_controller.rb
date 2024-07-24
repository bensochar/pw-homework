class BuildingsController < ApplicationController
  include Pagy::Backend
  before_action :set_building, only: %i[ show edit update destroy ]
  after_action { pagy_headers_merge(@pagy) if @pagy }

  # GET /buildings
  def index
    @pagy, @buildings = pagy(Building.includes(:client).all)
    respond_to do |format|
      format.html # index.html.erb
      # format.json { render json: @buildings, include: [:client, :custom_fields] }
      format.json do
        render status: :ok, json: BuildingBlueprint.render(@buildings)
      end
    end
  end

  # GET /buildings/1
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  def create
    @building = Building.new(building_params)

    if @building.save
      redirect_to @building, notice: "Building was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /buildings/1
  def update
    if @building.update(building_params)
      redirect_to @building, notice: "Building was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /buildings/1
  def destroy
    @building.destroy!
    redirect_to buildings_url, notice: "Building was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:location_id, 
        :client_id,
        :street_address, 
        :city,
        :state, 
        :postcode, 
        :country,
        custom_fields: [
          config: [
            :name,
            :value
          ]
        ])
    end
end
