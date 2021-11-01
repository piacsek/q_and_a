require "test_helper"

class ModelCase < ActiveSupport::TestCase
  def assert_property_is_mandatory(model, property)
    model[property] = nil
    refute model.valid?, "Property #{property} of model #{model} should not accept nil as value"

    model[property] = ''
    refute model.valid?, "Property #{property} of model #{model} should not accept an empty string as value"
  end
end
