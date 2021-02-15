module UsersHelper

# 引数で与えられたユーザーの Gravatar 画像を返す
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=mp"
    image_tag(gravatar_url, alt: user.name, class: "gravatar icon-image host-icon")
  end
  
end
