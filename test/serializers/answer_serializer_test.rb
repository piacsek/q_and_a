require_relative 'serializer_case'

class AnswerSerializerTest < SerializerCase

  test 'serializes all expected fields' do
    answer = create :answer
    expected_serialized_answer = {body: answer.body, provider: UserSerializer.new(answer.provider).to_h}

    assert_expected_serialization answer, AnswerSerializer, expected_serialized_answer
  end
end
