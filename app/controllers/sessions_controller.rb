class SessionsController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(username: login_params[:username])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id 
			redirect_to dashboard_path
		else
			flash[:error] = "Oh no! Username or Password is incorrect!"
			@user = User.new
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path
	end

	private
		def login_params
			params.require(:user).permit(:username, :password)
		end
end