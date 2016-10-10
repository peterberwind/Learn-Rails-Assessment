class ProposalsController < ApplicationController

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

  private

  def proposal_params
    params.require(:proposal).permit(:title, :tagline, :status, :project_id)
  end

end
