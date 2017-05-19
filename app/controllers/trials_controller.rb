class TrialsController < ApplicationController
  #There should be validation that the user is authorized to work with this trial
  #before allowing the "run" action, but all my attempts throw up a bug
  #where it "Can't find a project without an ID"
  before_action :project,   only: [:create, :destroy, :show, :new]
  before_action :logged_in_user, only: [:create, :destroy, :show, :new, :run]
  before_action :correct_user,   only: [:create, :destroy, :show, :new]


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
  
  def run
  end
  
    private
	def project
	  @project = Project.find(params[:project_id])
	end

    def correct_user
      redirect_to root_url unless current_user.id==project.user_id
    end

    def trial_params
      params.require(:trial).permit(:title, :synopsis, :temp, :location)
    end
  
  
end
