post '/destinations' do
  @destination = params[:destination].downcase
  @destination.gsub!(" ", "%20")
  redirect "/destinations/#{@destination}"
end

get '/destinations/:name' do
  @destination = params[:name]
  @destination.gsub!("%20", " ")
  @details = @destination.split(", ")

  youtube_obj = YouTubeCustomSearch.custom_search("traditional #{@details.last} music")
  @video_id = youtube_obj["items"][0]["id"]["videoId"]

  # tries each portion of the expanded location to account for
  # very specific locations that unsplash doesn't have photos for
  @found_place = @details.find{|query| Unsplash::Photo.search(query).first }
  if @found_place != nil
    @photos_json_obj = Unsplash::Photo.search(@found_place)
    @main_link = @photos_json_obj.shift.urls["regular"]
    @traid_links = triptyk_maker(@photos_json_obj)
    @current_users_list = current_user.destinations.pluck(:name) if logged_in?
    erb :'/destinations/show'
  else
    @error = "Please enter a more general location"
    erb :index
  end

end
