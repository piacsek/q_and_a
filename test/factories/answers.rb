FactoryBot.define do
  factory :answer do
    body { 'Does it really matter, bro?' }
    question
    provider { association :user, name: 'Provider User' }
  end
end