class Product < ApplicationRecord
    has_many :order_items
    has_one_attached :picture
    has_one_attached :image
    validates :name, presence: true
    validates :bar_code, presence: true
    validates :price, presence: true
    
end
