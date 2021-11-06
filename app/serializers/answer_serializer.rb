class  AnswerSerializer < ActiveModel::Serializer
  attributes :body
  belongs_to :provider do
    UserSerializer.new(object.provider)
  end
end