class Item < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  validates :name, :price, presence: { message: "Necessary Fields"}
  validates :price, numericality: { message: "Integer Only"}
end
