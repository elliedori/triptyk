get '/' do
  @photos_json_obj = Unsplash::Photo.search("Cambodia")
  @link = @photos_json_obj.first.urls["regular"]
  erb :index
end
