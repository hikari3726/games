class Review < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  
  validates :evalution, presence: { message: "を選択してください" }
  validates :comment, presence: true, length: { maximum: 500 }
  
  belongs_to :user
  belongs_to :game
  
end
