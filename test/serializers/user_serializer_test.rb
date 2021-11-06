require_relative 'serializer_case'

class UserSerializerTest < SerializerCase

  test 'serializes all expected fields' do
    user = build_stubbed :user
    expected_serialized_user = {name: user.name, id: user.id}

    assert_expected_serialization user, UserSerializer, expected_serialized_user
  end
end
