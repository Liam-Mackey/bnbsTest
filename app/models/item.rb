class Item < ApplicationRecord
	belongs_to :product
	validates :waist, :product, :length, :style, :count, presence: true
end
