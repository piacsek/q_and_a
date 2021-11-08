FactoryBot.define do
  factory :answer do
    body { FFaker::HipsterIpsum.sentence }
    question
    provider { create(:user) }
  end
end
