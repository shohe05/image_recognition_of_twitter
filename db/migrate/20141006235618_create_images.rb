class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :url
      t.string :tweet_url
      t.datetime :posted

      t.timestamps
    end
  end
end
