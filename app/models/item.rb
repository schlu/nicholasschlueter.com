class Item < ActiveRecord::Base
  named_scope :flickr, :conditions => {:source => "flickr"}
  named_scope :twitter, :conditions => {:source => "twitter"}
  named_scope :simpltry, :conditions => {:source => "simpltry"}
  named_scope :latest, :order => "published_at DESC", :limit => 20
end
