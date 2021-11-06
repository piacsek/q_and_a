require './test/test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "returns HTTP 200 and JSON response containing all non-private questions" do
    skip 'waiting for serializers implementation'
    expected_response = Question.includes(:answers).all.to_json

    get api_questions_url

    assert_response :success
    assert expected_response == response.body
  end
end