require './test/test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  test "returns HTTP 200 and JSON response containing all non-private questions" do
    create_list :question, 3, :private, :with_answers
    create_list :question, 5, :with_answers

    expected_response = Question.is_public.includes(:asker, answers: :provider).map do |question|
      QuestionSerializer.new(question)
    end.to_json

    get api_questions_url

    assert_response :success
    assert expected_response == response.body, "\nExpected:\n#{expected_response} \n\nActual:\n#{response.body.to_json}"
  end
end
