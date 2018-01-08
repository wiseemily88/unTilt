class Competency < ApplicationRecord
  has_many :interview_competencies
  has_many :interviews, through: :interview_competencies

end
