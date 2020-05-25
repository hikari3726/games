class RemoveEvalutionFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :rank_id, :integer
  end
end
