class Product < ApplicationRecord
	has_many :items
	validates :product_name, presence: true, uniqueness: true
	validates :product_image, presence: true

end
