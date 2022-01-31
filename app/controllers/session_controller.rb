class SessionController < ActionController
   def create 
    user = User.find_by(username: params[:session][:username])
    if user
    	log_in ( user )
    else 
    	render 'new'
    end 
   end 
   def destory
   	log_out if logged_in?
   	redirect_to root_path

end