require 'test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "returns HTTP 200 and JSON response containing all non-private questions" do
    expected_response = Question.includes(:answers).all.to_json
    puts expected_response

    get v1_questions_url

    assert_response :success
    assert expected_response == response.body
  end
end