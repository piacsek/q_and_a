class Tenant < ApplicationRecord
  validates :name, :api_key, presence: true
  after_create do # offline redis would stop Tenants which probably wouldn't be the intended behaviour
    redis.set(id, 0)
  end

  def usage_count
    redis.get(id).to_i
  end

  def register_usage
    redis.incr(id)
  end

  private

  def redis
    Redis.current
  end
end
