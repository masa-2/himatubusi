class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :name, presence: true, length: { maximum: 20 }
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
