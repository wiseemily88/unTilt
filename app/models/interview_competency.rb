class InterviewCompetency < ApplicationRecord
  belongs_to :interview
  belongs_to :competency
  accepts_nested_attributes_for :competency
end
