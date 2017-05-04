class ProjectsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy, :show, :new]
  before_action :correct_user,   only: [:create, :destroy, :show, :new]
  
  def show
    @project = Project.find(params[:id])
	@trials = @project.trials.paginate(page: params[:page])
  end
  
  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      flash[:success] = "Project created!"
      redirect_to user_project_path(current_user.id, @project)
    else
      render 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = "Project updated"
      redirect_to user_project_path(current_user.id, @project)
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    flash[:success] = "Project deleted."
    redirect_to request.referrer || root_url
  end
  
    private
    def correct_user
      @project = current_user.projects.find(params[:id])
      redirect_to root_url if @project.nil?
    end

    def project_params
      params.require(:project).permit(:title, :synopsis)
    end
  
end
