require 'test_helper'

class DeletingProductsTest < ActionDispatch::IntegrationTest
  setup do
    @product = Product.create!(name: 'Quartz', description: 'Bad gem', price: 10)
  end

  test 'deletes a product' do
    delete "/apiv1/products/#{@product.id}"

    assert_equal 204, response.status
  end
end
