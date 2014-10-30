require 'test_helper'

class ListingProductsTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: 'Gems')
    @category.products.create!(name: 'Ruby', description: 'Best gem', price: 1000)
    @category.products.create!(name: 'Sapphire', description: 'Not as good as ruby', price: 500)
  end

  test 'listing products' do
    get '/products'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    products = json(response.body)
    assert_equal Product.count, products.size
    product = Product.find(products.first[:id])
    assert_equal @category.id, product.category.id
  end

  test 'lists most expensive products' do
    get '/products?price=1000'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 1, json(response.body).size
  end
end
