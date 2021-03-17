require 'test_helper'

class BreweriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get breweries_index_url
    assert_response :success
  end

  test "should get show" do
    get breweries_show_url
    assert_response :success
  end

  test "should get edit" do
    get breweries_edit_url
    assert_response :success
  end

  test "should get new" do
    get breweries_new_url
    assert_response :success
  end

end
