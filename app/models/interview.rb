class Interview < ApplicationRecord
  has_many :interview_competencies
  has_many :competencies, through: :interview_competencies
  belongs_to :user
  belongs_to :candidate
  accepts_nested_attributes_for :interview_competencies, allow_destroy: true
  accepts_nested_attributes_for :competencies, allow_destroy: true

  enum status: ["open", "completed"]

  validates :date, presence: true

  scope :open, -> { where(status: 0)}
  scope :completed, -> { where(status: 1)}
end
