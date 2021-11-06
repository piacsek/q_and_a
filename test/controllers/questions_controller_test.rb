require './test/test_helper'

class QuestionsControllerTest < ActionDispatch::IntegrationTest

  class AuthenticatedTest < ActionDispatch::IntegrationTest

    test "returns HTTP 200 and JSON response containing all public questions for" do
      create_list :question, 5, :with_answers
      tenant = create :tenant

      expected_response = Question.is_public.includes(:asker, answers: :provider).map do |question|
        QuestionSerializer.new(question)
      end.to_json
      api_key = tenant.api_key

      get api_questions_url, headers: { 'Authorization' => api_key }

      assert_response :success
      assert expected_response == response.body, "\nExpected:\n#{expected_response} \n\nActual:\n#{response.body.to_json}"
    end

    test 'returns HTTP 200 and a JSON response with an empty list if there are only private questions' do
      create_list :question, 3, :private, :with_answers
      tenant = create :tenant

      expected_response = [].to_json
      api_key = tenant.api_key

      get api_questions_url, headers: { 'Authorization' => api_key }

      assert_response :success
      assert expected_response == response.body, "\nExpected:\n#{expected_response} \n\nActual:\n#{response.body.to_json}"
    end

    test 'counts api_key utilization' do
      tenant = create :tenant
      Redis.current.set tenant.id, 0

      assert 0 == tenant.usage_count, "Wrong tenant usage count.\nExpected: 0\nActual: #{tenant.usage_count}"

      get api_questions_url, headers: { 'Authorization' => tenant.api_key }
      get api_questions_url, headers: { 'Authorization' => tenant.api_key }
      get api_questions_url, headers: { 'Authorization' => tenant.api_key }
      get api_questions_url, headers: { 'Authorization' => tenant.api_key }

      assert 4 == tenant.usage_count, "Wrong tenant usage count.\nExpected: 4\nActual: #{tenant.usage_count}"
    end
  end

  class AuthenticationFailureTest < ActionDispatch::IntegrationTest

    test 'returns http 401 when missing api_key' do
      get api_questions_url

      assert_response :unauthorized
    end

    test 'returns http 401 when provided api_key is invalid' do
      get api_questions_url, headers: { 'Authorization' => 'Non-existent' }

      assert_response :unauthorized
    end

    test 'returns http 401 & does not break when provided api_key is too long' do
      long_api_key = FFaker::Lorem.characters(16384)

      get api_questions_url, headers: { 'Authorization' => long_api_key }

      assert_response :unauthorized
    end
  end
end
