require_relative 'model_case'

class QuestionTest < ModelCase

  test 'mandatory attributes' do
    question = questions(:one_million_dollar_question)

    assert_property_is_mandatory question, :title
    assert_property_is_mandatory question, :is_private
  end

end
