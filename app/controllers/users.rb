get '/my_wanderlist' do
  @trips = current_user.trips
  erb :wanderlist
end

put '/my_wanderlist/:destination' do
    destination = Destination.find_or_create_by(name: params[:destination])
    new_trip = Trip.find_or_create_by(user_id: session[:id], destination_id: destination.id)
    if request.xhr?
      erb :"partials/_selected", layout: false, locals: {destination: destination.name}
    else
      redirect "/destinations/#{params[:destination]}"
    end
end

delete '/my_wanderlist/:destination' do
  destination_id = Destination.find_by(name: params[:destination])
  unwanted_trip = Trip.where(user_id: session[:id], destination_id: destination_id).first
  unwanted_trip.destroy
  if request.xhr?
    erb :"partials/_unselected", layout: false, locals: {destination: params[:destination]}
  else
    redirect "/destinations/#{params[:destination]}"
  end
end


get '/users/new' do
  erb:'users/new'
end

post '/users' do
  if params[:user][:password] != params[:confirm_password]
    "Passwords do not match, please try again."
  else
    params.delete("confirm_password")
    new_user = User.new(params[:user])
      if !new_user.save
       "Looks like you already have an account associated with that email, please log in."
      end
    login(new_user)
    redirect '/'
  end

end
