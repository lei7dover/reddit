class CreateSubreddits < ActiveRecord::Migration
  def change
    create_table :subreddits do |t|
      t.string :category

      t.timestamps null: false
    end
    add_column :links, :subreddit_id, :integer 
  end
end
