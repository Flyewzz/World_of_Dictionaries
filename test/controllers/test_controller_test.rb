require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get settings" do
    get test_settings_url
    assert_response :success
  end

  test "should get start" do
    get test_start_url
    assert_response :success
  end

  test "should get result" do
    get test_result_url
    assert_response :success
  end

  test "right words" do
    # get mark_factor (answers, answers_language, questions, count_of_questions)
     assert true
  end
end
