class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, -> { order(created_at: :desc) }, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :category_id, numericality: { other_than: 1, message: 'を選択してください' }

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?) OR text LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Article.all
    end
  end

  def liked_by(user)
    Like.find_by(user_id: user.id, article_id: id)
  end
end