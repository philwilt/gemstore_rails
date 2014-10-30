require 'test_helper'

class ListingCategoriesTest < ActionDispatch::IntegrationTest
  test 'list categories' do
    get '/apiv1/categories'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
