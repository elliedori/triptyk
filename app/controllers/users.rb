get '/my_wanderlist' do
  @trips = current_user.trips
  erb :wanderlist
end

put '/my_wanderlist/:destination' do
    destination = Destination.find_or_create_by(name: params[:destination])
    new_trip = Trip.create(user_id: session[:id], destination_id: destination.id)
    redirect '/my_wanderlist'
end

delete '/my_wanderlist/:destination' do
  destination_id = Destination.find_by(name: params[:destination])
  unwanted_trip = Trip.where(user_id: session[:id], destination_id: destination_id).first
  unwanted_trip.destroy
  redirect '/my_wanderlist'
end


get '/users/new' do
  erb:'users/new'
end

post '/users' do
  if params[:password] != params[:confirm_password]
    "Passwords do not match, please try again."
  else
    params.delete("confirm_password")
    new_user = User.new(params)
      if !new_user.save
       "Looks like you already have an account associated with that email, please log in."
      end
    redirect '/login'
  end

end