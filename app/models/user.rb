class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, :job_title, :department, :password, presence: true

  enum role: ["interviewer", "admin"]
  enum gender: ["male", "female", "transgender_female", "transgender_male", "gender_variant"]
  enum race: ["white", "black", "American_Indian", "Asian", "Native_Hawaiian"]
  enum education_level: ["high_school", "associate", "bachelor", "master", "doctoral"]
end
