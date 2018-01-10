class Interview < ApplicationRecord
  has_many :interview_competencies
  has_many :competencies, through: :interview_competencies
  has_many :interview_questions
  has_many :questions, through: :interview_questions
  belongs_to :user
  belongs_to :candidate
  accepts_nested_attributes_for :interview_competencies, allow_destroy: true
  accepts_nested_attributes_for :interview_questions, allow_destroy: true
  accepts_nested_attributes_for :competencies, allow_destroy: true
  accepts_nested_attributes_for :questions

  enum status: ["open", "completed"]

  validates :date, presence: true

  scope :open, -> { where(status: 0)}
  scope :completed, -> { where(status: 1)}
end
