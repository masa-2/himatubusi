class Topic < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :topic_category
  
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  has_many :favorites
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments
  
  mount_uploader :image, ImageUploader
  
  def self.search(search)
    if search
      where(['description LIKE ?', "%#{search}%"])
    else
      all
    end
  end
  
end


