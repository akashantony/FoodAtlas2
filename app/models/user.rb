class User < ApplicationRecord
  validates :username, :email, uniqueness: true
  validates :password, :username, :email, {presence: true}

  has_many :photos
  has_many :restaurants, through: :photos
  has_many :created_restaurants, class_name: "Restaurant", foreign_key: "creator_id"
  has_secure_password
end
