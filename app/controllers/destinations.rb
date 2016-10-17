post '/destinations' do
  @destination = params[:destination].downcase
  p @destination
  @destination.gsub!(" ", "%20")
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  @destination = params[:name]
  @destination.gsub!("%20", " ")
  photos_json_obj = Unsplash::Photo.search(@destination)
  youtube_obj = YouTubeCustomSearch.custom_search("traditional #{@destination} music")
  @video_id = youtube_obj["items"][0]["id"]["videoId"]
  if photos_json_obj.first
    @link = photos_json_obj.first.urls["regular"]
    @current_users_list = current_user.destinations.pluck(:name) if logged_in?
    erb :'/destinations/show'
  else
    "Please enter a more general location"
  end
end
