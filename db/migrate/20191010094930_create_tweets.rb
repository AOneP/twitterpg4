class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :nickname
      t.string :uuid
      t.string :text
      t.string :full_text
      t.string :url
      t.datetime :tweet_time

      t.timestamps
    end
  end
end
