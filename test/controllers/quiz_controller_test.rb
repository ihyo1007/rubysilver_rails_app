require "test_helper"

class QuizControllerTest < ActionDispatch::IntegrationTest
  test "should get random" do
    get quiz_random_url
    assert_response :success
  end

  test "should get result" do
    get quiz_result_url
    assert_response :success
  end
end
