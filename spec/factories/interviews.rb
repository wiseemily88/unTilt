FactoryBot.define do
  factory :interview do
    date { Faker::Date.forward(60) }
    score { Faker::Number.between(1, 5) }
    status 0
    user
    candidate

    association :attribute_1, factory: :attribute
    attribute_2 { attribute_1 }
    attribute_3 { attribute_1 }
    attribute_4 { attribute_1 }



    factory :completed_interview, class: Interview do
      date { Faker::Date.forward(60) }
      score { Faker::Number.between(1, 5) }
      status 1
      user
      candidate
      association :attribute_1, factory: :attribute
      attribute_2 { attribute_1 }
      attribute_3 { attribute_1 }
      attribute_4 { attribute_1 }

    end
  end
end
