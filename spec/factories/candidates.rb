FactoryBot.define do
  factory :candidate do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    target_role { Faker::Job.title }

    factory :candidate_with_upcoming_interview, class: Candidate do
     after(:create) do |candidate|
       create(:interview_with_competencies, candidate: candidate)
     end
   end
  end
end
