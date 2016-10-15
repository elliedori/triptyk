put '/my_wanderlist/:destination' do
  destination = Destination.find_by(name: params[:destination])
  if destination == nil
    destination = Destination.create(name: params[:destination].capitalize)
  end
  new_trip = Trip.create(user_id: session[:id], destination_id: destination.id)

  redirect '/my_wanderlist'
end

get '/my_wanderlist' do
  @trips = current_user.trips
  erb :wanderlist
end
