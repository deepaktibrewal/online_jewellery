class Item < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  validates :name, :price, presence: { message: "Necessary Fields"}
  validates :price, numericality: { message: "Integer Only"}
end
