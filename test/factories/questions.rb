FactoryBot.define do
  factory :question do
    title { 'Would you try it again?' }
    is_private { false }
    asker { association :user }

    trait :private do
      is_private { true }
    end

  end
end