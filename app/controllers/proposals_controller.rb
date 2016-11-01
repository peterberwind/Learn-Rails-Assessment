class ProposalsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_project

  def index
    @proposals = @project.proposals
  end

  def show
    @proposal = @project.proposals.find(params[:id])
  end

  def new
    @proposal = @project.proposals.build
  end

  def create
    @proposal = @project.proposals.new(proposal_params)
    if @proposal.save
      flash[:success] = "Proposal was saved!"
      redirect_to @project
    else
      flash[:error] = "There was an error!"
      render action: "new"
    end
  end

  def edit
    @proposal = @project.proposals.find(params[:id])
  end

  def update
    @proposal = @project.proposals.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      flash[:success] = "Proposal was updated!"
      redirect_to @project
    else
      flash[:error] = "There was an error!"
      render action: "edit"
    end
  end

  def destroy
    @proposal = @project.proposals.find(params[:id])
    if @proposal.destroy
      flash[:warn] = "Proposal was Deleted!"
      redirect_to @project
    else
      flash[:error] = "There was an error!"
      render action: show
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :status)
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

end
