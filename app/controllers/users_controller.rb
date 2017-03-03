class UsersController < ApplicationController
	before_action :update_user_params, only: [:update]

	def dashboard
	end

  def update
    if current_user.authenticate(params[:user][:original_password])
      if current_user.update(user_params)
        flash[:notice] = "Information updated!"
        redirect_to dashboard_path
      else
        flash[:error] = "Oh no! Your info could not be updated!"
        render :dashboard
      end

    else
        flash[:error] = "Oh no! Your info could not be updated!"
        render :dashboard
    end
  end

  private
  	def user_params
  		params.require(:user).permit(:username, :password)
  	end

  	def update_user_params
  		params.require(:user).permit(:username, :original_password, :password)
  	end

end