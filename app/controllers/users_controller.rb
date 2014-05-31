class UsersController < ApplicationController
	private

		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end

	public
		def show
			@user = User.find(params[:id])
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
			if @user.save
				sign_in @user
				flash[:success] = "Welcome to my Twitter Mockup!"
				redirect_to @user
			else
				render 'new'
			end
		end
end
