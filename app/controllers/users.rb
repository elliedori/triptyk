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
