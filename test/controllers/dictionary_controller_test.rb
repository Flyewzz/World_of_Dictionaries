require 'test_helper'

class DictionaryControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers

  test "should not get input" do
    get dictionary_new_url
    assert_response :redirect
  end

  test "should not get edit" do
    get dictionary_edit_url
    assert_response :redirect
  end

  ######### test, which create new user and log in. Also it checks that user can perform calculations #########
  test "should get result with authenticate" do
    # RSpec.configure do |config|
    #   config.include Devise::TestHelpers, type: :controller
    # end
    @new_user = User.create(email: 'test@mail.ru', password: '123456',
                            password_confirmation: '123456')
    sign_in @new_user
    get dictionary_new_url
    assert_response :success
  end

end
