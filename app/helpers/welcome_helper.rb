module WelcomeHelper
  def twitter_image(user = false)
    link_to image_tag("http://assets1.twitter.com/images/favicon.ico"), "http://twitter.com/#{user ? 'schlu' : ''}"
  end
  
  def flickr_image(user = false)
    link_to image_tag("http://flickr.com/favicon.ico"), "http://flickr.com/#{user ? 'dcrails' : ''}"
  end
  
  def momentile_image(user = false)
    link_to image_tag("http://momentile.com/favicon.ico"), "http://momentile.com/#{user ? 'schlu' : ''}"
  end
  
  def simpltry_image
    link_to image_tag("http://www.simpltry.com/wp-content/themes/simpltry/images/simpltryvine.gif"), "http://simpltry.com"
  end
end
