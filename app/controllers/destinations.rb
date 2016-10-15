post '/destinations' do
  @destination = params[:destination].downcase
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  p params
  @destination = params[:name]
  @photos_json_obj = Unsplash::Photo.search(@destination)
  @link = @photos_json_obj.first.urls["regular"]
  @current_users_list = current_user.destinations.pluck(:name)
  # current_user.destinations.each do |place|
  #   @current_users_list << place.name
  # end
  puts "*********"
  p @current_users_list
  erb :'/destinations/show'
end
