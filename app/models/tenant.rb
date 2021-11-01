class Tenant < ApplicationRecord
  validates :name, :api_key, presence: true
end
