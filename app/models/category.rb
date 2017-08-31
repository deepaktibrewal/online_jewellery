class Category < ApplicationRecord
  has_many :items

  validates :name, uniqueness: { message: "Already exists" }
  validates :name, presence: { message: "Necessary Fields"}
end
