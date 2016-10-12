class ProposalsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @proposals = Proposal.all
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if @proposal.save
      flash[:success] = "Proposal was saved!"
      redirect_to @proposal
    else
      flash[:error] = "There was an error!"
      render action: "new"
    end
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      flash[:success] = "Proposal was updated!"
      redirect_to @proposal
    else
      flash[:error] = "There was an error!"
      render action: "edit"
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :status)
  end

end
