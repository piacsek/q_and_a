require './test/test_helper'

class ModelCase < ActiveSupport::TestCase
  def refute_property_is_nullable(model, property)
    model[property] = nil
    refute model.valid?, "Property #{property} of model #{model} should not accept nil as value"
  end

  def refute_property_accepts_blank_string(model, property)
    model[property] = ''
    refute model.valid?, "Property #{property} of model #{model} should not accept an empty string as value"
  end
end
