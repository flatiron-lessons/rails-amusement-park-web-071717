class SessionsController < ApplicationController

	def create
		# binding.pry
		# when you submit sessions#new form, it comes her
		@user = User.find_by(name: params[:user][:name])
		if @user && @user.authenticate(params[:user][:password])
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to signin_path
		end
	end

	def destroy
		session.clear
		redirect_to '/'

	end

end