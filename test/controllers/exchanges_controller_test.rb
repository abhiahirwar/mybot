require 'test_helper'

class ExchangesControllerTest < ActionDispatch::IntegrationTest
  test "should get bittrex" do
    get exchanges_bittrex_url
    assert_response :success
  end

end
