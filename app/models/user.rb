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
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :user
  has_one_attached :image
  
  validates :nickname, presence: true

  VALID_PASSWORD_REGIX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGIX }, on: :create
  validates :password, format: { with: VALID_PASSWORD_REGIX }, on: :update, allow_blank: :true

  def update_without_current_password(params, *options)
    
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update(params, *options)
    clean_up_passwords
    result
  end

  def following?(user)
    followings.include?(user)
  end

  def follow(user_id)
    relationships.create(follower: user_id)
  end

  def unfollow(relationship_id)
    relationships.find(relationship_id).destroy!
  end
end
