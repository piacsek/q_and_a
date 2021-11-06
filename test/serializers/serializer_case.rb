require './test/test_helper'

class SerializerCase < ActiveSupport::TestCase

  def assert_expected_serialization(model, serializer_class, expectation)
    expectation = expectation.deep_symbolize_keys
    serialized_model = serializer_class.new(model).to_h.deep_symbolize_keys

    assert expectation == serialized_model, "\nExpected:\n#{expectation} \n\nActual:\n#{serialized_model}"
  end
end