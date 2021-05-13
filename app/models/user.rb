class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :articles
  has_many :comments
  has_many :likes
  has_many :talks
  has_many :responses
  
  validates :nickname, presence: true

  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end
end
