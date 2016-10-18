post '/destinations' do
  @destination = params[:destination].downcase
  p @destination
  @destination.gsub!(" ", "%20")
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  @destination = params[:name]
  @destination.gsub!("%20", " ")

  youtube_obj = YouTubeCustomSearch.custom_search("traditional #{@destination} music")
  @video_id = youtube_obj["items"][0]["id"]["videoId"]

  @details = @destination.split(", ")
  @found_place = @details.find{|query| Unsplash::Photo.search(query).first }

  if @found_place == nil
    @error = "Please enter a more general location"
    erb :index
  else
  @photos_json_obj = Unsplash::Photo.search(@found_place)
  @photos_json_obj.first
    @link = @photos_json_obj.first.urls["regular"]
    @current_users_list = current_user.destinations.pluck(:name) if logged_in?
    erb :'/destinations/show'
  end

end
