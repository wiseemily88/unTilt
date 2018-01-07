FactoryBot.define do
  factory :attribute do
    name {Faker::Hipster.word}
    description {Faker::Company.catch_phrase}

  end
end
