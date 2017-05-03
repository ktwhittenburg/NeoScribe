class TrialsController < ApplicationController

  def show
    @trial = Trial.find(params[:id])
  end
	
  def new
    @trial = Trial.new
  end
	
  def create
    @trial = current_user.trials.build(trial_params)
    if @trial.save
      flash[:success] = "Trial created!"
      redirect_to user_trial_path(current_user.id, @trial)
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
      redirect_to user_trial_path(current_user.id, @trial)
    else
      render 'edit'
    end
  end
  
  def destroy
    @trial.destroy
    flash[:success] = "Trial deleted."
    redirect_to request.referrer || root_url
  end
  
    private
    def correct_user
      @trial = current_user.trial.find_by(id: params[:id])
      redirect_to root_url if @trial.nil?
    end

    def trial_params
      params.require(:trial).permit(:title, :synopsis)
    end
  
  
end
