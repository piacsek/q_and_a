require_relative 'model_case'

class UserTest < ModelCase

  test 'mandatory attributes' do
    user = users(:student)

    assert_property_is_mandatory user, :name
  end


end
