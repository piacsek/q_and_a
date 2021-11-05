require_relative 'model_case'

class UserTest < ModelCase

  test 'mandatory attributes' do
    user = build :user

    refute_property_is_nullable user, :name
    refute_property_accepts_blank_string user, :name
  end


end
