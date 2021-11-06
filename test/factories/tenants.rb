FactoryBot.define do
  factory :tenant do
    name { FFaker::Company.name }
    api_key { FFaker::Lorem.characters(64) }
  end
end