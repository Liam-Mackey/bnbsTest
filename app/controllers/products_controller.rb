class ProductsController < ApplicationController

	def index 
		@products = Product.all

		@object = []
		@products.each do |product|
			product_hash = {
				product_name: product.product_name,
				product_image: product.product_image,
				product_description: product.product_description,
				product_items: product.items
			}

			@object.push(product_hash)
		end

		json_response(@object)
	end


	def json_response(object, status = :ok)
	    render json: object, status: status
	end
end
