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
  has_one_attached :image
  
  validates :nickname, presence: true

  VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX }, on: :create
  validates :password, format: { with: VALID_PASSWORD_REGIX }, on: :update, allow_blank: :true

  def liked_by?(article_id)
    likes.where(article_id: article_id).exists?
  end
end
