class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			UserNotifier.send_signup_email(@user).deliver
			redirect_to @user # user_path(@user)
		else
			flash[:errors] = @user.errors.full_messages.join(', ')
			render :new
		end
	end

	def show
		@songs = current_user.songs.all
	end

	private

	def user_params
		params.require(:user).permit(:first_name,
																 :last_name,
																 :email,
																 :username,
																 :password,
																 :password_confirmation)
	end
end
