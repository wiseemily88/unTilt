class Competency < ApplicationRecord
  has_many :interview_competencies
  has_many :interviews, through: :interview_competencies
  has_many :questions
  accepts_nested_attributes_for :interview_competencies, allow_destroy: true

end
