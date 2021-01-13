module ApplicationHelper

  def gravatar_for(user, options = { size: 80, class: '' })
    image_tag("http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{options[:size]}", alt: user.username, class: "shadow rounded mx-auto  #{options[:class]}")
  end

end
