require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'name is a mandatory attribute' do
    user = users(:student)

    user.name = nil
    refute user.valid?
  end


end
