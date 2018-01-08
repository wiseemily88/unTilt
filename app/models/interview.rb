class Interview < ApplicationRecord
  has_many :interview_competencies
  has_many :competencies, through: :interview_competencies
  belongs_to :user
  belongs_to :candidate

  enum status: ["open", "completed"]

  validates :date, presence: true

  scope :open, -> { where(status: 0)}
  scope :completed, -> { where(status: 1)}
end
