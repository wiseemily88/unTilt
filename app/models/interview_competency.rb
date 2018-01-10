class InterviewCompetency < ApplicationRecord
  belongs_to :interview
  belongs_to :competency
  accepts_nested_attributes_for :competency, allow_destroy: true
  accepts_nested_attributes_for :interview,  allow_destroy: true
end
