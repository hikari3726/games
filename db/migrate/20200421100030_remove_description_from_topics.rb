class RemoveDescriptionFromTopics < ActiveRecord::Migration[5.2]
  def change
    remove_column :topics, :description, :string
  end
end
