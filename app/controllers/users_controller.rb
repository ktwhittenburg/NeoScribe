class UsersController < ApplicationController
  before_action :logged_in_user

  def show
    @user = User.find(params[:id])
	@projects = @user.projects.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
	  log_in @user
	  flash[:success] = "Welcome to Neoscribe! Thank you for your signup."
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
	
	# Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
	
end