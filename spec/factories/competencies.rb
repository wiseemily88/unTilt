FactoryBot.define do
  factory :competency do
    name {Faker::Hipster.word}
    description {Faker::Company.catch_phrase}
  end
end
