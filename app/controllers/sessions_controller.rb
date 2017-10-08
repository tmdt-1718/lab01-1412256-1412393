class SessionsController < ApplicationController
	add_breadcrumb "Home", :home_index_path
    def new
		add_breadcrumb "Login", login_path
	end

	def create
		user = User.find_by(email: session_params[:email])
		if user
			if user.authenticate(session_params[:password])
            	login(user)
				flash[:success] = "Login successfully."
				redirect_to blogs_path
        	else
            	flash[:error] = "Wrong email or password."
				render :new
			end
		else
			flash[:error] = "Wrong email or password."
			render :new
		end
	end

	def destroy
		logout
		redirect_to login_path
	end

	private
	def session_params
		params.require(:session).permit(:email, :password)
	end
end
