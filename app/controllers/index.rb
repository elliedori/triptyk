get '/' do
  @photo = Unsplash::Photo.find("tAKXap853rY")
  @link = @photo.urls["regular"]
  p @link
  erb :index
end
