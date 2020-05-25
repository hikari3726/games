class AddDetailsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rank_id, :integer
  end
end
