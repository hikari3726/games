class Game < ApplicationRecord
  
  default_scope -> { order(created_at: :desc) }
  
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :title, presence: true
  validates :genre, presence: { message: "を選択してください"}
  validates :participation, presence: { message: "を選択してください"}
  validates :target_age, presence: { message: "を選択してください"}
  validates :play_time, presence: { message: "を選択してください"}
  validates :price, presence: { message: "を選択してください"}
  validate :image_size
  
  
  belongs_to :user
  has_many :reviews
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: "user"  

  mount_uploader :image, ImageUploader
  
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "5MB以内の画像にしてください")
      end
    end
  
end
