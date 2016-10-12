class ProjectsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Project was saved!"
      redirect_to @project
    else
      flash[:error] = "There was an error!"
      render action: "new"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project was updated!"
      redirect_to @project
    else
      flash[:error] = "There was an error!"
      render action: "edit"
    end
  end

  private

  def project_params
    params.require(:project).permit(:title, :tagline, :status, :client_id)
  end

end
