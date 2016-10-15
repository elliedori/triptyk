get '/' do
  erb :index
end

get '/login' do
  erb :login
end

post '/login' do
  current_user = User.authenticate(params[:email], params[:password])
  if current_user
    login(current_user)
    redirect '/'
  else
    "Invalid login, please try again"
  end
end

get '/logout' do
  logout
end

