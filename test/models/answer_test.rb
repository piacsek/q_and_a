require_relative 'model_case'

class AnswerTest < ModelCase
  test 'mandatory attributes' do
    answer = answers(:classmate_answer)

    assert_property_is_mandatory answer, :body
  end
end
