class Response < ApplicationRecord
  belongs_to :talk
  belongs_to :user
  
  validates :text, presence: true
end
