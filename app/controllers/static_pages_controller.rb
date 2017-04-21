class StaticPagesController < ApplicationController
  def home
      @project = current_user.projects.build if logged_in?
  end
  def help
  end 
  
  def about
  end
end
