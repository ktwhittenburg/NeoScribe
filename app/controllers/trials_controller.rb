class TrialsController < ApplicationController

before_action :project,   only: [:create, :destroy, :show, :new]

  def show
    @trial = Trial.find(params[:id])
  end
	
  def new
    @trial = Trial.new
  end
	
  def create
    @trial = project.trials.build(trial_params)
    if @trial.save
      flash[:success] = "Trial created!"
      redirect_to project_trial_path(project.id, @trial)
	  #redirect_to user_project_path(current_user.id, project.id)
    else
      render 'new'
    end
  end
  
  def edit
    @trial = Trial.find(params[:id])
  end
  
  def update
    @trial = Trial.find(params[:id])
    if @trial.update_attributes(trial_params)
      flash[:success] = "Trial updated"
      redirect_to project_trial_path(project.id, @trial)
    else
      render 'edit'
    end
  end
  
  def destroy
    @trial = Trial.find(params[:id])
    @trial.destroy
    flash[:success] = "Trial deleted."
    redirect_to request.referrer || root_url
  end
  
    private
	def project
		@project = current_user.projects.find(params[:id])
	end
	
    def correct_user
      @trial = current_user.trial.find(id: params[:id])
      redirect_to root_url if @trial.nil?
    end

    def trial_params
      params.require(:trial).permit(:title, :synopsis, :temp, :location)
    end
  
  
end
