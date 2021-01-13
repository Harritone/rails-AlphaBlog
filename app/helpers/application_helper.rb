module ApplicationHelper
  def gravatar_for(user, options = { size: 80 })
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{options[:size]}", alt: user.username, class: 'shadow rounded mx-auto d-block')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # session[user_id] ? true : false
    !!current_user
  end

end
