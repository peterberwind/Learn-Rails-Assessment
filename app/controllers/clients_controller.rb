class ClientsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.user = current_user
    if @client.save
      flash[:success] = "Client was saved!"
      redirect_to @client
    else
      flash[:error] = "There was an error!"
      render action: "new"
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      flash[:success] = "Client was updated!"
      redirect_to @client
    else
      flash[:error] = "There was an error!"
      render action: "edit"
    end
  end

  def self.most_recent_proposals
    self.proposals
  end

  private

  def client_params
    params.require(:client).permit(:name, :contact, :email, :phone)
  end

end
