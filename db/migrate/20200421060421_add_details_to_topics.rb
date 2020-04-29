class AddDetailsToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :participation, :integer
    add_column :topics, :target_age, :integer
    add_column :topics, :play_time, :integer
    add_column :topics, :evalution, :integer
    add_column :topics, :genre, :string
    add_column :topics, :price, :integer
  end
end
