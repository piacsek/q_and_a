FactoryBot.define do
  factory :question do
    title { FFaker::HipsterIpsum.sentence }
    is_private { [true, false].sample }
    asker { association :user }

    trait :private do
      is_private { true }
    end

    trait :with_answers do
      after(:create) do |question|
        # I would consider using a random number here too to test effects or arbitrary sized lists
        create_list :answer, rand(30), question: question, body: FFaker::HipsterIpsum.sentence
      end
    end
  end
end
