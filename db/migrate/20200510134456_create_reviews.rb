class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :evalution
      t.text :comment

      t.timestamps
    end
  end
end
