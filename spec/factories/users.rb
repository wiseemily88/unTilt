FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email     { Faker::Internet.safe_email }
    password "password"
    job_title { Faker::Job.title }
    department { Faker::Job.field }
    role 0

    factory :admin_user, class: User do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email     { Faker::Internet.safe_email }
      password "password"
      job_title { Faker::Job.title }
      department { Faker::Job.field }
      role 1
    end
  end
end
