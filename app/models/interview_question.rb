class InterviewQuestion < ApplicationRecord
  belongs_to :interview
  belongs_to :question
  accepts_nested_attributes_for :question, allow_destroy: true
  accepts_nested_attributes_for :interview,  allow_destroy: true
end
