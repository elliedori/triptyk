# require_relative '../../config.rb'

# Unsplash.configure do |config|
#   config.application_id = APP_ID
#   config.application_secret = SECRET
#   config.application_redirect_uri = "http://localhost:9393/auth/callback"
# end

get '/' do
  @photo = Unsplash::Photo.find("tAKXap853rY")
  p @photo.class
  erb :index
end
