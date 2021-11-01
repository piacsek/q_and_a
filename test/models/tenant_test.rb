require_relative 'model_case'

class TenantTest < ModelCase
  test 'mandatory model attributes' do
    tenant = tenants(:basic_access)
    assert_property_is_mandatory tenant, :name
    assert_property_is_mandatory tenant, :api_key
  end
end
