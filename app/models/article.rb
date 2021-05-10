class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end
end