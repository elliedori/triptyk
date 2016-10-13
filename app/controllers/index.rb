get '/' do
  @photo = Unsplash::Photo.find("tAKXap853rY")
  p @photo
  data = JSON.parse(File.read(@photo), symbolize_keys: true)
  erb :index
end
