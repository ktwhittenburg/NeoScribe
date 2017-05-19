class BehaviorController < ApplicationController
  before_action :trial, only: [:create, :destroy, :new, :update]
  before_action :logged_in_user, only: [:create, :destroy, :new]
  before_action :correct_user,   only: [:create, :destroy, :new]


  def new

  end
  
  def create

  end
  
  #edit and update should not be given their own pages; they should be implemented as incrementing the count parameter
  #and linked to the appropriate button on the run trial page
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
    private
	
  def trial
    #The goal of this method is to retrieve the trial that you are associating with this behavior.
	#It's a particularly hard problem, so good luck to future programmers on this project
  end
  
  def correct_user
	#Fairly simple: make sure that the user here has the rights to the trial this behavior is part of. 
	#Otherwise redirect
  end
  
      def behavior_params
      params.require(:trial).permit(:name)
    end
end