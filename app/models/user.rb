class User < ApplicationRecord
  has_and_belongs_to_many :items
  has_secure_password

  validates :name, :email, :password_digest, :user_type, :contact, :address, presence: { message: "Necessary Fields"}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "Not Valid Email" }
  validates :email, :contact, uniqueness: { message: "Already exists" }
  validates :contact, numericality: { message: "Integer Only"}
  validates :contact, length: { minimum: 8, maximum: 10, message: "contact no should have 8-10 digits" }
end
