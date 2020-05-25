class AddEvalutionsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :evalution, :float
  end
end
