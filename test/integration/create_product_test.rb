require 'test_helper'

class CreateProductTest < ActionDispatch::IntegrationTest
  test 'creates a new product with valid data' do
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

  test 'does not create a new product with invalid name' do
    post '/products', { product: {
      name: nil,
      description: 'The best gem',
      price: 1000
    } }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end

  test 'does not create a new product with invalid description' do
    post '/products', { product: {
      name: 'Ruby',
      description: nil,
      price: 1000
    } }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end

  test 'does not create a new product with invalid price' do
    post '/products', { product: {
      name: 'Ruby',
      description: 'The best gem',
      price: nil
    } }.to_json,
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
  end
end
