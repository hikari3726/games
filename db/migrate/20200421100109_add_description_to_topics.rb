class AddDescriptionToTopics < ActiveRecord::Migration[5.2]
  def change
    add_column :topics, :description, :text
  end
end
