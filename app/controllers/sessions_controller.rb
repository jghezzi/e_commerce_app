class SessionsController <ApplicationController
	skip_filter :ensure_logged_in, only: [:new, :create]

	def new
	
	end

	def create
		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
		
		if user
			session[:user_id] = user.id
			redirect_to items_path, notice: "Logged In!"
		else
			flash.now.alert = "Invalid E-mail or Password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You logged out!"	
	end

end