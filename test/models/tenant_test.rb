# frozen_string_literal: true

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
    tenant_calls = 10

    tenant_calls.times.each { |_n| tenant.register_usage }

    assert tenant.usage_count == tenant_calls
  end

  test 'tenant usage 0 when newly created' do
    tenant = create :tenant

    assert tenant.usage_count.zero?, "Wrong tenant usage count.\nExpected: 0\nActual: #{tenant.usage_count}"
  end

  test '#register_usage increments the tenant usage by 1' do
    tenant = create :tenant

    tenant.register_usage
    assert tenant.usage_count == 1

    tenant.register_usage
    assert tenant.usage_count == 2

    tenant.register_usage
    assert tenant.usage_count == 3
  end
end
