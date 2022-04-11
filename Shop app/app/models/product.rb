class Product < ApplicationRecord
    has_many :order_items
    has_one_attached :image

    validates :name, presence: true
    validates :price, presence: true
    validates :image, presence: true
end
