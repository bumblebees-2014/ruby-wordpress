def find_user
	User.find_by(id: session[:user_id])
end