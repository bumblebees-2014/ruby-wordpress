# ================= CREATE NEW USER =====================

get '/user/new' do
	erb :create_user
end

post '/user/create' do
	@user = User.create(params[:user])
	session[:user_id] = @user.id
	redirect '/inbox'
end



#========================LOGIN===========================

get '/login' do
	erb :login
end

post '/login' do
	@user = User.find_by username: params[:user][:username]
	session[:user_id] = @user.id
	p @user
	if @user.nil?
		session[:error] = "You must be logged in to access this page."
		redirect '/login'
	end

	@user = @user.authenticate(params[:password])

	if @user
		session[:user_id] = @user.id
		session[:error] = nil
		redirect '/inbox'

	else
		session[:error] = "username/password is incorrect"
		redirect '/'
	end
end

# ================= LOGOUT =====================

get '/logout' do
	session[:user_id] = nil
	redirect '/'
end











