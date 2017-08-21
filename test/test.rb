
test "The JSON Response works" do

	response = open('http://localhost:3000/products')

	assert_equals "washed chinos", response[0].product_name

end