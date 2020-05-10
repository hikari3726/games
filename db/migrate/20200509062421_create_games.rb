class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.string :genre
      t.string :participation
      t.string :target_age
      t.string :play_time
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
