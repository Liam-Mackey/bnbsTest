require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest


	setup do
	  @request.headers['Accept'] = Mime::JSON
	  @request.headers['Content-Type'] = Mime::JSON.to_s

	end

	test "The JSON Response works" do
		get products_url
		assert_response :success
		body = JSON.parse(response.body)
		assert_equal "washed chinos", body[0]['product_name']
	end
end
