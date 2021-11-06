FactoryBot.define do
  factory :answer do
    body { FFaker::HipsterIpsum.sentence }
    question
    provider { association :user, name: FFaker::Name.name }
  end
end