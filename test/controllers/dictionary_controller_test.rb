require 'test_helper'

class DictionaryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dictionary_new_url
    assert_response :success
  end

  test "should get index" do
    get dictionary_index_url
    assert_response :success
  end

  test "should get show" do
    get dictionary_show_url
    assert_response :success
  end

  test "should get destroy" do
    get dictionary_destroy_url
    assert_response :success
  end

  test "should get edit" do
    get dictionary_edit_url
    assert_response :success
  end

  test "should get interactive" do
    get dictionary_interactive_url
    assert_response :success
  end

end
