require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  test 'creates a new product' do
    post '/products', { product: {
      name: 'Ruby',
      description: 'The best gem',
      price: 1000
    } }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert 201, response.status
    assert_equal Mime::JSON, response.content_type
    product = json(response.body)
    assert_equal product_url(product[:id]), response.location
    assert_equal 'Ruby', product[:name]
    assert_equal 'The best gem', product[:description]
    assert_equal 1000, product[:price].to_i
  end
end
