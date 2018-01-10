class Question < ApplicationRecord
  belongs_to :competency
  has_many :interview_questions
  has_many :interviews, through: :interview_questions
end
