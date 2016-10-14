post '/destinations' do
  @destination = params[:destination].downcase
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  p params
  @destination = params[:name].capitalize
  @photos_json_obj = Unsplash::Photo.search(@destination)
  @link = @photos_json_obj.first.urls["regular"]
  erb :'/destinations/show'
end
