helpers do

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def logged_in?
    current_user
  end

  def login(user)
    session[:id] = user.id
  end

  def logout
    session[:id] = nil
    redirect '/'
  end

  #write helper method to parse out images into groups of 3 under Unsplash class"
end
