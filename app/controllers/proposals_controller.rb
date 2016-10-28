class ProposalsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @proposals = @project.proposals
  end

  def show
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.build
  end

  def create
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.new(proposal_params)
    if @proposal.save
      flash[:success] = "Proposal was saved!"
      redirect_to @project, @proposal
    else
      flash[:error] = "There was an error!"
      render action: "new"
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @proposal = @project.proposals.find(params[:id])
    if @proposal.update_attributes(proposal_params)
      flash[:success] = "Proposal was updated!"
      redirect_to @project, @proposal
    else
      flash[:error] = "There was an error!"
      render action: "edit"
    end
  end

  def destroy
    @project = Project.find(params[:project_id])
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

end
