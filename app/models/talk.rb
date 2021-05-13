class Talk < ApplicationRecord
  belongs_to :user
  has_many :responses

  with_options presence: true do
    validates :title
    validates :text
  end
end
