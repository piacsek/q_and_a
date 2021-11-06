class Api::QuestionsController < ApplicationController
  def index
    public_questions = Question.is_public.includes(:asker, answers: :provider)
    serialized_questions = public_questions.map { |question| QuestionSerializer.new(question).as_json }

    render json: serialized_questions
  end
end
