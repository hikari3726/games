class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true, length: { maximum: 500 }
  validates :title, presence: true
  validates :genre, presence: { message: "を選択してください"}
  validates :participation, presence: { message: "を選択してください"}
  validates :target_age, presence: { message: "を選択してください"}
  validates :play_time, presence: { message: "を選択してください"}
  validates :price, presence: { message: "を選択してください"}
  validates :evalution, presence: { message: "を選択してください"}
  validate :image_size
  
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
  
  private
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "5MB以内の画像にしてください")
      end
    end
end
