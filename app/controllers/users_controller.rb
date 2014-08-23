class UsersController < ApplicationController
	before_action :admin_page, only: [:edit, :update]

	def edit
		@user = current_user
	end

	def update
		#temp render
		@user = current_user
		old_password = params[:user][:old_password]
		if @user.authenticate(old_password)
			@user.update(user_change_params)
			flash[:success] = "Change successfully"
			redirect_to root_path
		else
			flash[:error] = "Old Password wrong"
			render 'edit'
		end
		
	end


	private
	    def admin_page
	      unless signed_in?
	        redirect_to root_path
	      end
	    end

	    def user_change_params
	    	params[:user].permit(:user, :password)
	    end


end
