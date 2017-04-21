class ProjectsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  
  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
end
