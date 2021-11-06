require_relative 'serializer_case'

class QuestionSerializerTest < SerializerCase

  test 'serializes all expected fields' do
    question = create :question, :with_answers
    expected_serialized_question = {
        id: question.id,
        title: question.title,
        asker: UserSerializer.new(question.asker).to_h,
        answers: question.answers.map{ |answer| AnswerSerializer.new(answer).to_h }
    }

    assert_expected_serialization question, QuestionSerializer, expected_serialized_question
  end
end
