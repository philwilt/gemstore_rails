require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    Product.create!(name: 'Ruby', description: 'Best gem', price: 1000)
    Product.create!(name: 'Sapphire', description: 'Not as good as ruby', price: 500)
  end
  test 'listing products' do
    get '/products'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert Product.count, JSON.parse(response.body).size
  end
end
