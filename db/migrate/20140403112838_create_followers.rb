class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower_id
      t.belongs_to :users
      t.timestamps
    end
  end
end
