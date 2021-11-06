class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :asker do
    UserSerializer.new(object.asker).to_h
  end

  has_many :answers do
    object.answers.map { |answer| AnswerSerializer.new(answer).to_h }
  end
end