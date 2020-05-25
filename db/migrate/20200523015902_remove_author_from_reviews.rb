class RemoveAuthorFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :evalution, :float
  end
end
