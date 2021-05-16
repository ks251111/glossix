class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  with_options presence: true do
    validates :title
    validates :text
  end

  validates :category_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ""
      Article.where('title LIKE(?) OR text LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Article.all
    end
  end
end