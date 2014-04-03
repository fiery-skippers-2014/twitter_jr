class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :tweet, :limit => 140
      t.timestamps
      t.belongs_to :user
    end
  end
end
