require_relative 'model_case'

class QuestionTest < ModelCase

  test 'mandatory attributes' do
    question = questions(:one_million_dollar_question)

    assert_property_is_mandatory question, :title
    assert_property_is_mandatory question, :is_private
  end

  test 'is_public scope' do
    expected_questions_sql = Question.all.where(is_private: false).to_sql
    assert expected_questions_sql == Question.is_public.to_sql
  end

  test 'with_answers scope' do
    expected_questions_sql = Question.all.left_joins(:answers).to_sql
    assert expected_questions_sql == Question.with_answers.to_sql
  end

end
