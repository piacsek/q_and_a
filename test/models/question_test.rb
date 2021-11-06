require_relative 'model_case'

class QuestionTest < ModelCase

  test 'mandatory attributes' do
    question = build :question

    refute_property_is_nullable question, :title
    refute_property_is_nullable question, :is_private

    refute_property_accepts_blank_string question, :title
  end

  test 'is_public scope' do
    expected_questions_sql = Question.all.where(is_private: false).to_sql
    assert expected_questions_sql == Question.is_public.to_sql
  end

end
