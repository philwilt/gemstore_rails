require 'test_helper'

class ListingBooksInCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create!(name: 'Gems')
    @category.products.create!(name: 'Ruby', description: 'Best gem', price: 1000)
    @category.products.create!(name: 'Sapphire', description: 'Not as good as ruby', price: 500)
  end

  test 'lists books under a category' do
    get "/categories/#{@category.id}"

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    category = json(response.body)
    product = Product.find(category[:products].first[:id])
    assert_equal @category.id, product.category_id
  end
end
