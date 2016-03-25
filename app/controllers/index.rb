enable :sessions

get '/' do
  redirect '/home'
end

get '/home' do
  if session[:id] == nil
    redirect('/login')
  else
    following = User.find(session[:id]).following
    if following != nil
      following.each{|user|
        user.quot.each{|quot|
          @quots << quot
        }
      }
     @sessions = sessions
    else
      @quots = []
    end
    erb :index
  end
end

# post '/user' do
#   user = User.new(display_name: params[:display_name], handle: params[:handle],description: params[:description], email: params[:email], password: params[:password], gravator: params[:gravator])
#   if user.save
#     session[:id] = user.id
#     session[:display_name] = users.display_name
#     session[:email] = users.email
#     session[:visit] = 0
#     @followers = user.followers
#     @following = user.following
#     redirect "/home/user/:id/quots"
#   else
#     redirect "/user/new"
#   end
# end

get '/user/new' do
  erb :new
end

get '/user/:id' do
  @user = User.find(params[:id])
  @followers = @user.followers
  @following = @user.following
  @quots = @user.quots
  erb :show
end

get '/user/:id/followers' do
  @user = User.find(params[:id])
  @followers = @user.followers
  erb :followers
end

get '/user/:id/following' do
  user = User.find(params[:id])
  @following = user.following
  erb :following
end

get '/login' do
  erb :login
end


post '/login' do
  @user = User.authenticate(params[:email],params[:password])
  if @user
    session[:id] = @user.id
    session[:name] = @user.name
    session[:email] = @user.email
    session[:visit] = 0
    @following = @user.following
    @followers = @user.followers
    redirect '/home'
  else
    redirect "/login"
    @errors = "Wrong email or password"
  end
end

# get '/logout' do
#   sessions.clear
#   redirect '/home'
# end

# # get '/user/:usersid/quots' do
# #   @user = User.find(params[:usersid])
# #   @quots = @user.quots
# #   erb :"quots/index"
# # end

# # get '/user/:usersid/quots/:id' do
# #   @user = User.find(params[:usersid])
# #   @quot = Quot.find(params[:id])
# #   if @quot.save
# #     redirect "/users/#{params[:usersid]}/quots/#{params[:id]}"
# #   else
# #     erb :"quot/show"
# #   end
# # end

# post '/user/:id' do
#   user = User.find(session[:id])
#   following = User.find(params[:id])
#   user.following << following
#   redirect "/user/#{params[:id]}"
# end

# post '/home/quots' do
#   quot = Quot.new(text: params[:text], user_id: sessions[:id])
#   if quot.save
#     redirect '/home'
#   end
# end

# post '/requots' do
#   requot = quot.find(params[:quots_id])
#   user = User.find(session[:id])
#   user.requots << requot
#   redirect ('/home')
# end


