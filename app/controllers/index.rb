get '/' do
  @photo = Unsplash::Photo.search("Cambodia")
  # can access photos by index: 
puts "*****"
  p @photo.length
  @link = @photo[2].urls["regular"]
  # @link = @photo.first.urls["regular"]
  p @link
  erb :index
end
