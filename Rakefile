# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))

require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

require 'tasks/rails'


task :cron => :environment do
  require 'rss/2.0'
  require 'rest_client'

  response = RestClient.get "http://feeds.feedburner.com/Simpltry"
  result = RSS::Parser.parse(response, false)
  result.items.each do |rss_item|
    unless Item.count(:conditions => {:link => rss_item.link}) > 0
      item = Item.new
      item.source = "simpltry"
      item.link = rss_item.link
      item.title = rss_item.title
      item.published_at = Time.parse rss_item.pubDate.to_s
      item.body = rss_item.description
      if match = item.body.match(/<img.*src="(.*?)".*>/)
        item.image_url = match[1]
      end
      item.save
    end
  end

  response = RestClient.get "http://twitter.com/statuses/user_timeline/14716455.rss"
  result = RSS::Parser.parse(response, false)
  result.items.each do |rss_item|
    unless (rss_item.title.match(/@\w/) && !rss_item.title.match(/RW:/)) || Item.count(:conditions => {:link => rss_item.link}) > 0 || rss_item.title.match(/mtile.us\/schlu/)
      item = Item.new
      item.source = "twitter"
      item.link = rss_item.link
      item.title = rss_item.title.gsub(/schlu: /, "")
      item.published_at = Time.parse rss_item.pubDate.to_s
      item.body = rss_item.description
      if (match = item.body.match(/(http:\/\/.*?)(\s|\)|$)/)) && !match[1].match(/((jpe?g)|(gif)|(png))/)
        url_response = ""
        begin
          url_response = RestClient.get match[1]
        rescue
        end
      end
      item.save
    end
  end

  response = RestClient.get "http://api.flickr.com/services/feeds/photos_public.gne?id=66338587@N00&lang=en-us&format=rss_200"
  response.gsub!( 'date.Taken', 'dateTaken' )
  result = RSS::Parser.parse(response, false)
  result.items.each do |rss_item|
    unless Item.count(:conditions => {:link => rss_item.link}) > 0
      item = Item.new
      item.source = "flickr"
      item.link = rss_item.link
      item.title = rss_item.title
      item.published_at = Time.parse rss_item.pubDate.to_s
      item.body = rss_item.description
      item.image_url = item.body.match(/<img.*src="(.*?)".*>/)[1]
      item.save
    end
  end

  response = RestClient.get "http://momentile.com/schlu/rss"
  result = RSS::Parser.parse(response, false)
  result.items.each do |rss_item|
    unless Item.count(:conditions => {:link => rss_item.link}) > 0
      item = Item.new
      item.source = "momentile"
      item.link = rss_item.link
      item.published_at = Time.parse rss_item.pubDate.to_s
      item.title = item.published_at.to_s(:standard_date)
      item.body = rss_item.description
      item.image_url = item.body.match(/<img.*src="(.*?)".*>/)[1]
      item.save
    end
  end
end