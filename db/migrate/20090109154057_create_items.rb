class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :link
      t.string :image_url
      t.string :title
      t.text :body
      t.string :source
      t.datetime :published_at
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
