get '/' do
  # @photos_json_obj = Unsplash::Photo.search("Dariusz Sankowski")
  # p @photos_json_obj.length
  # @link = @photos_json_obj.first.urls["regular"]
  erb :index
end
