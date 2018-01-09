FactoryBot.define do
  factory :interview do
    date { Faker::Date.forward(60) }
    score { Faker::Number.between(1, 5) }
    status 0
    user
    candidate


    factory :completed_interview, class: Interview do
      date { Faker::Date.forward(60) }
      score { Faker::Number.between(1, 5) }
      status 1
      user
      candidate
    end

      factory :interview_with_competencies, class: Interview do
        after(:create) do |interview|
         competencies     = create_list(:competency, 3)
         interview.competencies << competencies
       end
     end

    end

end
