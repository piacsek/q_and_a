require 'test_helper'

class UserSerializerTest < ActiveSupport::TestCase

  test 'serializes all expected fields' do
    user = users(:student)
    expected_serialized_user = {name: user.name, id: user.id}.to_h
    serialized_user = UserSerializer.new(user).to_h
    assert expected_serialized_user == serialized_user, "\nExpected: #{expected_serialized_user} \nActual: #{serialized_user}"
  end
end