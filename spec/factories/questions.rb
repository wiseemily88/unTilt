FactoryBot.define do
  factory :question do
    question { Faker::ChuckNorris.fact }
    competency
  end
end
