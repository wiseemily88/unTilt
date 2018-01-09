class Competency < ApplicationRecord
  has_many :interview_competencies
  has_many :interviews, through: :interview_competencies
  accepts_nested_attributes_for :interview_competencies

end
