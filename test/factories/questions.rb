FactoryBot.define do
  factory :question do
    title { FFaker::HipsterIpsum.sentence }
    is_private { false }
    asker { association :user }

    trait :private do
      is_private { true }
    end

    trait :with_answers do
      after(:create) do |question|
        create_list :answer, 5, question: question, body: FFaker::HipsterIpsum.sentence
      end
    end
  end
end
