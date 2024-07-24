class ClientsController < ApplicationController
  include Pagy::Backend
  before_action :set_client, only: %i[ show edit update destroy ]

  # GET /clients
  def index
    @pagy, @clients = pagy(Client.all)
  end

  # GET /clients/1
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  def create
    @client = Client.new(client_params)
    @client.email.downcase!

    if @client.save
      redirect_to @client, notice: "Client was successfully created."
    else
      flash[:alert] = @client.errors.full_messages.join(', ')
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client was successfully updated.", status: :see_other
    else
      flash[:alert] = @client.errors.full_messages.join(', ')
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy!
    redirect_to clients_url, notice: "Client was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:email, :password_digest, :name)
    end
end
