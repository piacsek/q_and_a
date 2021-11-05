require_relative 'model_case'

class AnswerTest < ModelCase
  test 'mandatory attributes' do
    answer = build :answer

    refute_property_is_nullable answer, :body
    refute_property_accepts_blank_string answer, :body
  end
end
