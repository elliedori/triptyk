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

  def extract_link(unsplash_obj)
    unsplash_obj.urls["regular"]
  end

  def triptyk_maker(unsplash_arr)
    num_of_triads = unsplash_arr.length / 3
    traids = unsplash_arr[0..num_of_triads*3]
    links = []
    traids.each do |triad|
      links << extract_link(triad)
    end
    links
  end

  def restaurant_cleaner(restos)
    all_details = []
    restos.each do |resto|
      details = [resto.name, resto.url, resto.location.display_address, resto.display_phone[3..-1]]
      all_details << details
    end
    all_details
  end

end
