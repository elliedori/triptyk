enable :sessions

get '/' do
  redirect '/home/quots'
end

get '/home' do
  erb :index
end

post '/user' do
  user =User.new(name: params[:name], handle: params[:handle], email: params[email], password: params[:password], gravatar_link: params[:gravatar_link])
  if users.save
    session[:name] = users.name
    session[:email] = users.email
    session[:visit] = 0
    @followers = user.followers
    @following = user.following
    redirect "/home/user/:id/quots"
  else
    redirect "/user/new"
  end
end

get '/user/new' do
  erb :new
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :show
end

get '/user/:id/followers' do
  user = Users.find(params[:id])
  @followers = user.followers
  erb :followers
end

get '/user/:id/following' do
  user = User.find(params[:id])
  @following = user.following
  erb :following
end


get '/login' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:name] = @user.name
    session[:email] = @user.email
    session[:visit] = 0
    redirect '/home'
  else
    redirect "/users/new"
  end
end

get '/logout' do
  sessions.clear
  redirect '/frontpage'
end

# get '/user/:usersid/quots' do
#   @user = User.find(params[:usersid])
#   @quots = @user.quots
#   erb :"quots/index"
# end

# get '/user/:usersid/quots/:id' do
#   @user = User.find(params[:usersid])
#   @quot = Quot.find(params[:id])
#   if @quot.save
#     redirect "/users/#{params[:usersid]}/quots/#{params[:id]}"
#   else
#     erb :"quot/show"
#   end
# end

post '/following' do
  user = User.find(session[:id])
  followee = User.find(params[:id])
  user.following << followee
  redirect "/user/#{params[:id]}"
end
