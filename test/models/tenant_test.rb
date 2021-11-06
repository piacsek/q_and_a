require_relative 'model_case'

class TenantTest < ModelCase
  test 'mandatory model attributes' do
    tenant = build :tenant

    refute_property_is_nullable tenant, :name
    refute_property_is_nullable tenant, :api_key

    refute_property_accepts_blank_string tenant, :name
    refute_property_accepts_blank_string tenant, :api_key
  end

  test '#usage_count returns the expected amount when the tenant has already been used' do
    tenant = create :tenant
    Redis.current.set tenant.id, 10

    assert 10 == tenant.usage_count
  end

  test '#usage_count returns the expected amount when the tenant has never been used' do
    tenant = create :tenant
    Redis.current.set tenant.id, nil

    assert 0 == tenant.usage_count
  end

  test '#register_usage increments the tenant usage by 1'  do
    tenant = create :tenant
    Redis.current.set tenant.id, 0

    tenant.register_usage
    assert 1 == tenant.usage_count

    tenant.register_usage
    assert 2 == tenant.usage_count

    tenant.register_usage
    assert 3 == tenant.usage_count
  end

end
