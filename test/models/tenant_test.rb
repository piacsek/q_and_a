require_relative 'model_case'

class TenantTest < ModelCase
  test 'mandatory model attributes' do
    tenant = build :tenant

    refute_property_is_nullable tenant, :name
    refute_property_is_nullable tenant, :api_key

    refute_property_accepts_blank_string tenant, :name
    refute_property_accepts_blank_string tenant, :api_key
  end
end
