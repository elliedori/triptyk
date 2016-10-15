post '/destinations' do
  @destination = params[:destination].downcase
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  @destination = params[:name]
  @photos_json_obj = Unsplash::Photo.search(@destination)
  @link = @photos_json_obj.first.urls["regular"]
  @current_users_list = current_user.destinations.pluck(:name)
  erb :'/destinations/show'
end
