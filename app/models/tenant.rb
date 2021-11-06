class Tenant < ApplicationRecord
  validates :name, :api_key, presence: true

  def usage_count
    Redis.current.get(id).to_i
  end

  def register_usage
    Redis.current.incr(id)
  end
end
