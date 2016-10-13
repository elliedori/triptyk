get '/' do
  @photo = Unsplash::Photo.find("tAKXap853rY")
  @link = @photo.links["html"]
  # data = JSON.parse(File.read(@photo), symbolize_keys: true)
  erb :index
end
